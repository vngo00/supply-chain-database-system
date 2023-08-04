# This file will be used to create your unit tests to test your database models.
from models import *
from database import *

products = Product.get(10)
for product in products:
  print(product)


customers = customers.get(orders)
reponse = "Name:\n"
for customer in customer:
  reponse += customer.name + "\n"
print(response)