import java.util.Arrays;
import java.util.Comparator;

public class Main {

    public static void main(String[] args) {

        Product[] products = {
                new Product(101, "Bag", "Fashion"),
                new Product(102, "Laptop", "Electronics"),
                new Product(103, "Phone", "Electronics"),
                new Product(104, "Shoes", "Fashion"),
                new Product(105, "Watch", "Accessories")
        };

        System.out.println("Linear Search");

        Product linearResult =
                SearchAlgorithms.linearSearch(products, "Phone");

        if (linearResult != null)
            System.out.println(linearResult);
        else
            System.out.println("Product not found");

        Arrays.sort(products,
                Comparator.comparing(Product::getProductName));

        System.out.println();

        System.out.println("Binary Search");

        Product binaryResult =
                SearchAlgorithms.binarySearch(products, "Phone");

        if (binaryResult != null)
            System.out.println(binaryResult);
        else
            System.out.println("Product not found");
    }
}