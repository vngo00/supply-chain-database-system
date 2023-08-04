"""
In this file you must implement all your database models.
If you need to use the methods from your database.py call them
statically. For instance:
       # opens a new connection to your database
       connection = Database.connect()
       # closes the previous connection to avoid memory leaks
       connection.close()
"""

from database import *


class TestModel:
  """
    This is an object model example. Note that
    this model doesn't implement a DB connection.
    """

  def __init__(self, ctx):
    self.ctx = ctx
    self.author = ctx.message.author.name

  def response(self):
    return f'Hi, {self.author}. I am alive'


class Product:

  def __init__(self):
    self.name = None
    self.quantity = 0
    self.id = 0
    self.description = None

  @staticmethod
  def get(name):
    product_info = Database.select(Query.GET_PRODUCT, name)
    if not product_info:
      return None
    product = Product()
    product.name = product_info[0]['name']
    product.id = int(product_info[0]['product_id'])
    return product

  @staticmethod
  def get_products_by_unit(units):
    products = []
    product_data = Database.select(Query.N_UNITS_PRODUCT, units)
    for product in product_data:
      p = Product()
      p.name = product['name']
      p.quantity = product['total_quantity']
      products.append(p)
    return products

  @staticmethod
  def del_inventory(name):
    product = Product.get(name)
    if not product:
      return None
    data = Database.select(Query.DEL_INVENTORY, name)
    return "deleted inventories"

  @staticmethod
  def update_price(name, price):
    print(name)
    print(price)
    product = Product.get(name)
    print(product.id)
    if not product:
      return None
    data = Database.select(Query.UPDATE_PRICE, (int(price), int(product.id)))
    return "updated price"

  def add(name, description):
    data = Database.select(Query.ADD_PRODUCT, (name, description))
    return "added product"

  @staticmethod
  def all():
    data = Database.select(Query.ALL_PRODUCT)
    products = []
    for product in data:
      p = Product()
      p.name = product['name']
      p.description = product['description']
      products.append(p)
    return products


class Customer:

  def __init__(self):
    self.name = None

  @staticmethod
  def get(orders):
    customers = []
    customer_data = Database.select(Query.CUSTOMERS_WITH_N_PURCHASES, orders)
    for customer_info in customer_data:
      c = Customer()
      c.name = customer_info['name']
      customers.append(c)
    return customers

  @staticmethod
  def all():
    data = Database.select(Query.ALL_CUSTOMER)
    customers = []
    for customer in data:
      c = Customer()
      c.name = customer['name']
      customers.append(c)
    return customers


class Supplier:

  def __init__(self):
    self.name = None
    self.agreements = 0

  @staticmethod
  def all():
    suppliers = []
    s_data = Database.select(Query.SUPPLIERS_WITH_AGREEMENTS)
    for s_info in s_data:
      s = Supplier()
      s.name = s_info['name']
      s.agreements = int(s_info['agreement_count'])
      suppliers.append(s)
    return suppliers

  @staticmethod
  def get(name):
    supplier_data = Database.select(Query.GET_SUPPLIER, name)
    if not supplier_data:
      return None
    supplier = Supplier()
    supplier.name = supplier_data[0]['name']
    return supplier

  @staticmethod
  def add(name):
    supplier = Supplier.get(name)
    if not supplier:
      return None
    data = Database.select(Query.ADD_NEW_AGREEMENT, name)
    return "successfully added new agreement"

  @staticmethod
  def delete_agreements(name):
    supplier = Supplier.get(name)
    if not supplier:
      return None
    data = Database.select(Query.DEL_AGREEMENTS, namme)
    return "successfuly deleted agreements"
