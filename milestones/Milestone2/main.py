"""
The code below is just representative of the implementation of a Bot. 
However, this code was not meant to be compiled as it. It is the responsability 
of all the students to modifify this code such that it can fit the 
requirements for this assignments.
"""
import os
import discord
from discord.ext import commands
from models import *
from database import *

TOKEN = os.environ["DISCORD_TOKEN"]
intents = discord.Intents.all()

bot = commands.Bot(command_prefix='!', intents=discord.Intents.all())
db = None


@bot.event
async def on_ready():
  print(str(bot.user.name) + "   is online")
  db = Database.connect()


@bot.command(
  name="test",
  description="write your database business requirement for this command here")
async def _test(ctx):
  testModel = TestModel(ctx)
  response = testModel.response()
  await ctx.send(response)


# TODO: complete the following tasks:
#       (1) Replace the commands' names with your own commands
#       (2) Write the description of your business requirement in the description parameter
#       (3) Implement your commands' methods.


@bot.command(name="products_by_units",
             description="# retrieve a list of products that have at least # units in inventory")
async def _command1(ctx, args):
  products = Product.get_products_by_unit(args)
  response = "Name    |   Quantity\n"
  for product in products:
    response += product.name + "    |    " + str(product.quantity) + "\n"
  await ctx.send(response)


@bot.command(name="customers_by_orders", description="return a list of customer who have made more than # purchases")
async def _command2(ctx, orders):
  customers = Customer.get(orders)
  reponse = "Name:\n"
  for customer in customer:
    reponse += customer.name + "\n"
  await ctx.send(response)


@bot.command(name="suppliers", description="Return a list of suppliers order by the number of agreements in descending order")
async def _command3(ctx):
  suppliers = Supplier.all()
  response = "name     |       agreements\n"
  for supplier in suppliers:
    response += supplier.name + "      |      " + str(supplier.agreements) +"\n"
    
  await ctx.send(response)


@bot.command(name="add_agreement", description="Add a new agreement for a specific supplier")
async def _command4(ctx, name):
  response = Supplier.add(name)
  if not response:
    response = "error"
  await ctx.send(response)


@bot.command(name="delete_agreements", description="Delete all agreements from a specific supplier")
async def _command5(ctx, name):
  response = Supplier.delete_agreements(name)
  if not response:
    response = "error"
  await ctx.send(response)


@bot.command(name="delete_inventory", description="Delete all inventory records for a specific product")
async def _command6(ctx, name):
  response = Product.del_inventory(name)
  if not response:
    response = "error"
  await ctx.send(response)


@bot.command(name="update_price", description="update the prices of products based on a specified pricing rule")
async def _command7(ctx, *args):
  response = Product.update_price(args[0], args[1])
  if not response:
    response = "error"
  await ctx.send(response)


@bot.command(name="products", description="list all products")
async def _command8(ctx):
  products = Product.all()

  response = ""
  if not products:
    response = "error"
  response = "Name      |        Description\n"
  for product in products:
    response += product.name + "    |      " + str(product.description) + "\n"
  await ctx.send(response)


@bot.command(name="add_product", description="add product")
async def _command9(ctx, *args):
  response = Product.add(args[0], args[1])
  if not response:
    response = "error"
  await ctx.send(response)


@bot.command(name="customers",
             description="list all customers")
async def _command10(ctx):
  customers = Customer.all()

  response = ""
  if not customers:
    response = "error"
  response = "Name\n"
  for customer in customers:
    response += customer.name +"\n"
  await ctx.send(response)


@bot.command(name="cmd_11",
             description="database business requirement #11 here")
async def _command11(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_12",
             description="database business requirement #12 here")
async def _command12(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_13",
             description="database business requirement #13 here")
async def _command13(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_14",
             description="database business requirement #14 here")
async def _command14(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_15",
             description="database business requirement #15 here")
async def _command15(ctx, *args):
  await ctx.send("This method is not implemented yet")



bot.run(TOKEN)
