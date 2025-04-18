from django.db import models

class Categorias(models.Model):
    nome = models.CharField(max_length=50)
    descricao = models.CharField(blank=True, null=True, max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        db_table = 'categorias'

    def __str__(self):
        return self.nome

class Cliente(models.Model):
    nome = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    telefone = models.CharField(max_length=20, blank=True)
    cpf = models.CharField(max_length=14, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        db_table = 'clientes'

    def __str__(self):
        return self.nome
    
class Produto(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.CharField(null=True, blank=True, max_length=255)
    preco = models.DecimalField(max_digits=10, decimal_places=2)
    quantidade_estoque = models.IntegerField()
    categorias = models.ForeignKey(Categorias, on_delete=models.CASCADE, db_column='categoria_id')
    
    class Meta:
        db_table = 'produtos'
    def __str__(self):
        return self.nome

class Vendedor(models.Model):
    nome = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    senha = models.CharField(max_length=128, default='default_password')
    confSenha = models.CharField(max_length=128, default='default_password')
    comissao_percentual = models.DecimalField(max_digits=5, decimal_places=2, default=5.00)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nome
    
    class Meta:
        db_table = 'vendedores'
class Venda(models.Model):
    STATUS_CHOICES = [
        ('Pago', 'Pago'),
        ('Não Pago', 'Não Pago'),
        ('Agendado Pagamento', 'Agendado Pagamento'),
        ('Parcelado', 'Parcelado'),
        ('Pendente', 'Pendente'),
    ]

    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE, db_column='cliente_id')
    data_venda = models.DateTimeField()
    valor_total = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Pendente')
    def __str__(self):
        return f"Venda {self.id} - {self.cliente.nome} - {self.status}"
    
class ItensVenda(models.Model):
    venda = models.ForeignKey(Venda, related_name='itens_venda', on_delete=models.CASCADE)
    quantidade = models.IntegerField()
    
    class Meta:
        db_table = 'itens_venda'

class VendaProduto(models.Model):
    venda = models.ForeignKey(Venda, related_name='venda_produtos', on_delete=models.CASCADE)
    produto = models.ForeignKey(Produto, on_delete=models.CASCADE)
    quantidade = models.PositiveIntegerField()
    preco_unitario = models.DecimalField(max_digits=10, decimal_places=2, default=0.0)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    def __str__(self):
        return f"{self.id} -  {self.produto.nome} - Quantidade: {self.quantidade}"