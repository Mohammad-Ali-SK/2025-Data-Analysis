import json

def load_data():
    try:
        with open("products.txt", 'r') as file:
            return json.load(file)
    except FileNotFoundError:
        return []
    
def save_data(products):
    with open("products.txt",'w') as file:
        json.dump(products,file)


def display_all_products(products):
    print("\n _______________________________________")
    for index,products in enumerate(products,start=1):
        print(f"{index}. Name : {products['name']}, Price : {products['price']}, Quantity : {products['quantity']} ")
    print("\n _______________________________________")

def add_product(products):
    name = input("Enter the product name : ").lower()
    price = int(input("Enter the product price : "))
    quantity = int(input("Enter the product quantity : "))
    products.append({"name":name,"price":price,"quantity":quantity})
    save_data(products)

def search_product(products):
    name = input("Enter the product name : ").lower()
    for product in products:
        if product['name'] == name:
            print(f"Name : {product['name']}, Price : {product['price']}, Quantity : {product['quantity']} ")
        else:
            print("sorry product not found")
            
def delete_product(products):
    display_all_products(products)
    index = int(input("Enter the product number to delete : "))
    if 1 <= index <= len(products):
        del products[index - 1]
        save_data(products)
    else:
        print("Invalid Index !")
        
        
def update_product(products):
    display_all_products(products)
    index = int(input("Enter the video update : "))
    if 1 <= index <= len(products):
        name = input("Enter the product name : ").lower()
        price = int(input("Enter the product price : "))
        quantity = int(input("Enter the product quantity : "))
        products[index-1] = {"name":name,"price":price,"quantity":quantity}
        save_data(products)
    else:
        print("Invalid Index Selected !")
        

def main():
    products = load_data()
    while True:
        print("--------------------------------------------------")
        print("\n Welcome to Our Store!")
        print("\n 1. Display all products")
        print("\n 2. Search for a product")
        print("\n 3. Add a product")
        print("\n 4. Delete a product")
        print("\n 5. Update a product")
        print("\n 6. Exit")
        print("\n--------------------------------------------------")
        # print(products)
        choice = input("Enter Your Choice: ")
        
        match choice:
            case "1":
                display_all_products(products)
            case "2":
                search_product(products)
            case "3":
                add_product(products)
            case "4":
                delete_product(products)
            case "5":
                update_product(products)
            case "6":
                break
            case _:
                print("Please enter a valid choice")
                
if __name__ == "__main__":
    main()