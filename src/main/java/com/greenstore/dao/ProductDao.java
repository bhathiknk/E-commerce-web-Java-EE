package com.greenstore.dao;

import java.io.File;
import java.sql.*;
import java.util.*;
import com.greenstore.model.Cart;
import com.greenstore.model.Product;

public class ProductDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public ProductDao(Connection con) {
		this.con = con;
	}
	
	
	public List<Product> getAllProducts() {
        List<Product> book = new ArrayList<>();
        try {

            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	
	
	 public Product getSingleProduct(int id) {
		 Product row = null;
	        try {
	            query = "select * from products where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

    // Add this method in ProductDao.java
    public List<Product> getProductsByCategory(String category) {
        List<Product> categoryProducts = new ArrayList<>();
        try {
            query = "select * from products where category=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, category);
            rs = pst.executeQuery();

            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                categoryProducts.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return categoryProducts;
    }
    // Add this method to get a product by ID
    public Product getProductById(int id) {
        Product product = null;
        try {
            query = "select * from products where id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return product;
    }

    // Add this method to ProductDao.java
    public void addProduct(Product product) throws SQLException {
        try {
            // Ensure 'name' is not null before inserting into the database
            if (product.getName() == null || product.getName().trim().isEmpty()) {
                System.out.println("Error: 'name' cannot be null or empty.");
                return;
            }

            // Extract file name from the image path
            String fileName = new File(product.getImage()).getName();

            String query = "INSERT INTO products (name, category, price, image) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pst = this.con.prepareStatement(query)) {
                pst.setString(1, product.getName());
                pst.setString(2, product.getCategory());
                pst.setDouble(3, product.getPrice());
                pst.setString(4, fileName);  // Save only the original file name
                pst.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    // Add this method to ProductDao.java
    public void deleteProduct(int id) {
        try {
            query = "DELETE FROM products WHERE id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

    // Add this method to update a product in the database
    public void updateProduct(Product product) {
        try {
            String query = "UPDATE products SET name=?, category=?, price=?, image=? WHERE id=?";
            try (PreparedStatement pst = this.con.prepareStatement(query)) {
                pst.setString(1, product.getName());
                pst.setString(2, product.getCategory());
                pst.setDouble(3, product.getPrice());
                pst.setString(4, product.getImage());
                pst.setInt(5, product.getId());

                pst.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

}

/*
 * Created by IntelliJ IDEA.
 * @author Bhathika Nilesh
 * @since 2023/12
 */
