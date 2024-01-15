using System.Runtime.ExceptionServices;
using System;
using System.Collections.Generic;

namespace Problem5
{
    class p5
    {
        public static void Main(string[] args)
        {
            // Create a new shopping cart
            ShoppingCart cart = new ShoppingCart();

            // Create some sample products
            Product product1 = new Product { Name = "Shirt", Price = 25.99m };
            Product product2 = new Product { Name = "Jeans", Price = 39.99m };
            Product product3 = new Product { Name = "Shoes", Price = 49.99m };

            // Add products to the cart
            cart.AddProduct(product1);
            cart.AddProduct(product2);
            cart.AddProduct(product3);

            Console.WriteLine("Shopping Cart Contents:");
            product1.printproduct();
            product2.printproduct();
            product3.printproduct();

            // Calculate and print the total
            decimal total = cart.CalculateTotal();
            Console.WriteLine("Total: $" + total);

            // Remove a product from the cart
            //cart.RemoveProduct(product2);

            // Calculate and print the updated total
            //total = cart.CalculateTotal();
            //Console.WriteLine("Updated Total: $" + total);

            // Clear the cart
            //cart.ClearCart();
            //Console.WriteLine("Cart cleared. Total: $" + cart.CalculateTotal());
        }
    }
    public class Product
    {
        public string Name { get; set; }
        public decimal Price { get; set; }

        public void printproduct()
        {
            Console.WriteLine($"{Name} - ${Price}");
        }
    }

    public class ShoppingCart
    {
        private List<Product> products;

        public ShoppingCart()
        {
            products = new List<Product>();
        }

        public void AddProduct(Product product)
        {
            products.Add(product);
        }

        //public void RemoveProduct(Product product)
        //{
        //    products.Remove(product);
        //}

        //public void ClearCart()
        //{
        //    products.Clear();
        //}

        public decimal CalculateTotal()
        {
            decimal total = 0;
            foreach (var product in products)
            {
                total += product.Price;
            }
            return total;
        }
    }
}








