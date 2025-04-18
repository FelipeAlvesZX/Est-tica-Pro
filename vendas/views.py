from .forms import ProdutoForm, VendaForm, VendedorForm, CategoriasForm, ClienteForm, LoginForm
from .models import Produto, Venda, Categorias, Cliente, Vendedor, VendaProduto
from django.core.paginator import Paginator
from django.shortcuts import render, redirect
from django.utils import timezone
from django.db.models import Sum
from django.contrib.auth import authenticate, login
from django.contrib import messages
from django.contrib.auth.hashers import make_password, check_password
from django.db import transaction
from django.contrib.auth import logout


def vendedor_login_required(view_func):
    def _wrapped_view(request, *args, **kwargs):
        print("Verificando se o vendedor está logado...")
        if 'vendedor_id' not in request.session:
            messages.error(request, 'Você precisa estar logado para acessar esta página.')
            return redirect('vendedor_login')
        return view_func(request, *args, **kwargs)
    return _wrapped_view

def logout_view(request):
    logout(request)
    return redirect('vendedor_login')

# -------------------------------------- cadastro e login -------------------------------------------------------

def vendedor_cadastro_view(request):
    if request.method == 'POST':
        form = VendedorForm(request.POST)
        if form.is_valid():
            vendedor = form.save(commit=False)
            vendedor.senha = make_password(form.cleaned_data['senha'])
            vendedor.save()
            print(f"Vendedor cadastrado: {vendedor.nome}")
            messages.success(request, 'Cadastro realizado com sucesso! você pode fazer login agora.')
            return redirect('vendedor_login')
        else:
            messages.error(request, 'Erro ao cadastrar o vendedor. Verifique os dados.')
    else:
        form = VendedorForm()

    return render(request, 'registration/cadastro.html', {'form': form})

def vendedor_login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            senha = form.cleaned_data['senha']
            try:
                vendedor = Vendedor.objects.get(email=email)
                if vendedor and check_password(senha, vendedor.senha):
                    request.session['vendedor_id'] = vendedor.id
                    messages.success(request, 'Login bem-sucedido!')
                    return redirect('home')
                else:
                    messages.error(request, 'Email ou senha inválidos.')
            except Vendedor.DoesNotExist:
                messages.error(request, 'Email ou senha inválidos.')
    else:
        form = LoginForm()

    return render(request, 'registration/login.html', {'form': form})
# ------------------------------------- Tela Inicial -------------------------------------------------------

@vendedor_login_required
def home(request):
    vendedor = None
    if 'vendedor_id' in request.session:
        try:
            vendedor = Vendedor.objects.get(id=request.session['vendedor_id'])
        except Vendedor.DoesNotExist:
            return redirect('vendedor_login')
    return render(request, 'home.html', {'vendedor': vendedor})



# ------------------------------------- Adicionar / Criar -------------------------------------------------------

@vendedor_login_required
def criar_produto(request):
    if request.method == 'POST':
        form = ProdutoForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Produto criado com sucesso!')
            return redirect('lista_produtos')
    else:
        form = ProdutoForm()
    return render(request, 'vendas/criar_produto.html', {'form': form})


@vendedor_login_required
def criar_venda(request):
    produtos = Produto.objects.all()
    if request.method == 'POST':
        form = VendaForm(request.POST)
        if form.is_valid():
            venda = form.save(commit=False) 
            venda.data_venda = timezone.now() 
            venda.valor_total = 0  

            try:
                with transaction.atomic():
                    produtos_ids = request.POST.getlist('produto_id')
                    quantidades_vendidas = request.POST.getlist('quantidade_vendida') 

                    if not produtos_ids or not quantidades_vendidas:
                        messages.error(request, 'Nenhum produto foi selecionado para a venda.')
                        return redirect('criar_venda')

                    venda.save()

                    for produto_id, quantidade in zip(produtos_ids, quantidades_vendidas):
                        quantidade_vendida = int(quantidade)
                        produto = Produto.objects.get(id=produto_id)

                        if produto.quantidade_estoque >= quantidade_vendida:
                            produto.quantidade_estoque -= quantidade_vendida
                            produto.save()
                            
                            preco_unitario = produto.preco
                            subtotal = quantidade_vendida * preco_unitario
                            venda.valor_total += subtotal  

                            item_venda = VendaProduto(
                                venda=venda, 
                                produto=produto,
                                quantidade=quantidade_vendida,
                                preco_unitario=preco_unitario
                            )
                            item_venda.save()
                        else:
                            messages.error(request, f'Estoque insuficiente para o produto {produto.nome}.')
                            return redirect('criar_venda')

                    venda.save()

                    messages.success(request, 'Venda criada com sucesso e estoque atualizado!')
            except Exception as e:
                messages.error(request, f'Ocorreu um erro ao criar a venda: {e}')
                return redirect('criar_venda')

            return redirect('lista_vendas')
    else:
        form = VendaForm()

    return render(request, 'vendas/criar_venda.html', {'form': form, 'produtos': produtos})

@vendedor_login_required
def criar_categoria(request):
    if request.method == 'POST':
        form = CategoriasForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('lista_categorias') 
    else:
        form = CategoriasForm()
    
    return render(request, 'vendas/criar_categoria.html', {'form': form})

@vendedor_login_required
def adicionar_cliente(request):
    if request.method == 'POST':
        form = ClienteForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('lista_clientes')
    else:
        form = ClienteForm()
    
    return render(request, 'clientes/adicionar_cliente.html', {'form': form})


# ---------------------------------  Listas -----------------------------------------------------------

@vendedor_login_required
def lista_produtos(request):
    query = request.GET.get('q')
    produtos = Produto.objects.filter(nome__icontains=query) if query else Produto.objects.all()
    
    paginator = Paginator(produtos, 5)
    page_number = request.GET.get('page')
    produtos_page = paginator.get_page(page_number)
    
    return render(request, 'vendas/lista_produtos.html', {'produtos': produtos_page})


@vendedor_login_required
def lista_vendas(request):
    query = request.GET.get('q')
    vendas = Venda.objects.all().annotate(total_quantity=Sum('itens_venda__quantidade'))
    
    paginator = Paginator(vendas, 5)
    page_number = request.GET.get('page')
    vendas_page = paginator.get_page(page_number)
    vendas = vendas.annotate(total_quantity=Sum('itens_venda__quantidade'))
    
    return render(request, 'vendas/lista_vendas.html', {'vendas': vendas_page})

@vendedor_login_required
def lista_clientes(request):
        query = request.GET.get('q')
        clientes = Cliente.objects.filter(nome__icontains=query) if query else Cliente.objects.all()
        
        return render(request, 'clientes/lista_clientes.html', {'clientes': clientes})

@vendedor_login_required
def lista_categorias(request):
        query = request.GET.get('q')
        categorias = Categorias.objects.filter(nome__icontains=query) if query else Categorias.objects.all()
        
        return render(request, 'vendas/lista_categorias.html', {'categorias': categorias})


# --------------------------------------------------------------------------------------------

@vendedor_login_required
def altProduto(request, pk):
    contato = Produto.objects.get(id=pk)
    if str(request.method == 'POST'):
        form = ProdutoForm(instance=contato, data=request.POST)
        if form.is_valid():
            form.save()
            return redirect("lista_produtos")
        else:
            form =ProdutoForm(instance=contato)
        
        context ={
            "form": form,
            "object": contato
        }
        return render(request, "UpdateDelete/edtProduto.html", context)
    
@vendedor_login_required
def delProduto(request, pk):
    produto = Produto.objects.get(id=pk)
    if str(request.method) == 'POST':
        produto.delete()
        return redirect("lista_produtos")
        
    context = {
        "object": produto
    }
    
    return render(request, "UpdateDelete/exProduto.html", context)
# --------------------------------------------------------------------------------------------

@vendedor_login_required
def altCategoria(request, pk):
    contato = Categorias.objects.get(id=pk)
    if str(request.method == 'POST'):
        form = CategoriasForm(instance=contato, data=request.POST)
        if form.is_valid():
            form.save()
            return redirect("lista_categorias")
        else:
            form =CategoriasForm(instance=contato)
        
        context ={
            "form": form,
            "object": contato
        }
        return render(request, "UpdateDelete/edtCategoria.html", context)
    

@vendedor_login_required
def delCategoria(request, pk):
    categorias = Categorias.objects.get(id=pk)
    if str(request.method) == 'POST':
        categorias.delete()
        return redirect("lista_categorias")
        
    context = {
        "object": categorias
    }
    
    return render(request, "UpdateDelete/exCategoria.html", context)
# --------------------------------------------------------------------------------------------
@vendedor_login_required
def altVenda(request, pk):
    venda = Venda.objects.get(id=pk)  # Obter a venda pelo ID
    itens_venda_anteriores = list(venda.itens_venda.all())  # Itens antes da alteração
    
    if request.method == 'POST':
        form = VendaForm(instance=venda, data=request.POST)
        if form.is_valid():
            venda = form.save(commit=False)

            # Preparar dados da nova edição
            produtos_ids = request.POST.getlist('produto_id')
            quantidades_vendidas = request.POST.getlist('quantidade_vendida')

            with transaction.atomic():
                # Reverter estoque dos itens antigos
                for item in itens_venda_anteriores:
                    produto = item.produto
                    produto.quantidade_estoque += item.quantidade  # Repor estoque
                    produto.save()

                # Atualizar venda com os novos produtos
                venda.valor_total = 0
                venda.itens_venda.all().delete()  # Remover itens antigos

                for produto_id, quantidade in zip(produtos_ids, quantidades_vendidas):
                    produto = Produto.objects.get(id=produto_id)
                    quantidade_vendida = int(quantidade)

                    if produto.quantidade_estoque >= quantidade_vendida:
                        produto.quantidade_estoque -= quantidade_vendida
                        produto.save()

                        item_venda = VendaProduto(
                            venda=venda,
                            produto=produto,
                            quantidade=quantidade_vendida,
                            preco_unitario=produto.preco
                        )
                        item_venda.save()

                        venda.valor_total += quantidade_vendida * produto.preco
                    else:
                        messages.error(
                            request, f'Estoque insuficiente para o produto {produto.nome}.'
                        )
                        return redirect('altVenda', pk=pk)

                venda.save()
                messages.success(request, 'Venda alterada com sucesso!')
            return redirect("lista_vendas")
    else:
        form = VendaForm(instance=venda)

    context = {
        "form": form,
        "object": venda,
        "itens_venda": itens_venda_anteriores,
        "produtos": Produto.objects.all(),  # Para listar todos os produtos
    }
    return render(request, "UpdateDelete/edtVenda.html", context)

@vendedor_login_required
def delVenda(request, pk):
    venda = Venda.objects.get(id=pk)
    if str(request.method) == 'POST':
        venda.delete()
        return redirect("lista_vendas")
        
    context = {
        "object": venda
    }
    
    return render(request, "UpdateDelete/exVenda.html", context)
# --------------------------------------------------------------------------------------------
@vendedor_login_required
def altCliente(request, pk):
    contato = Cliente.objects.get(id=pk)
    if str(request.method == 'POST'):
        form = ClienteForm(instance=contato, data=request.POST)
        if form.is_valid():
            form.save()
            return redirect("lista_clientes")
        else:
            form =ClienteForm(instance=contato)
        
        context ={
            "form": form,
            "object": contato
        }
        return render(request, "UpdateDelete/edtCliente.html", context)
    

@vendedor_login_required
def delCliente(request, pk):
    cliente = Cliente.objects.get(id=pk)
    if str(request.method) == 'POST':
        cliente.delete()
        return redirect("lista_clientes")
        
    context = {
        "object": cliente
    }
    
    return render(request, "UpdateDelete/exCliente.html", context)