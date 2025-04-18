from django.urls import path
from . import views

urlpatterns = [
    path('home/ ', views.home, name='home'),
    path('', views.vendedor_login_view, name='vendedor_login'),
    path('cadastro/', views.vendedor_cadastro_view, name='vendedor_cadastro'),
# ------------------------------------- listas -------------------------------------------------------
    path('produtos/', views.lista_produtos, name='lista_produtos'),
    path('vendas/', views.lista_vendas, name='lista_vendas'),
    path('listaCategorias/', views.lista_categorias, name='lista_categorias'),
    path('lista/', views.lista_clientes, name='lista_clientes'),
# ---------------------------------- criar / adicionar ----------------------------------------------------------
    path('produtos/criar/', views.criar_produto, name='criar_produto'),
    path('vendas/criar/', views.criar_venda, name='criar_venda'),
    path('adicionar/', views.adicionar_cliente, name='adicionar_cliente'),
    path('criarCategoria/', views.criar_categoria, name='criar_categoria'),
# -------------------------------------- Alterar / Deletar ------------------------------------------------------
    path('AlterarProduto/<int:pk>',views.altProduto, name="altProduto"),
    path('DeletarProduto/<int:pk>',views.delProduto, name="delProduto"),
    path('AlterarCategoria/<int:pk>',views.altCategoria, name="altCategoria"),
    path('DeletarCategoria/<int:pk>',views.delCategoria, name="delCategoria"),
    path('AlterarVenda/<int:pk>',views.altVenda, name="altVenda"),
    path('DeletarVenda/<int:pk>',views.delVenda, name="delVenda"),
    path('AlterarCliente/<int:pk>',views.altCliente, name="altCliente"),
    path('DeletarCliente/<int:pk>',views.delCliente, name="delCliente"),
]