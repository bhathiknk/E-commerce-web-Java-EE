package com.greenstore.model;

public class Admin {
    private int id;
    private String email;
    private String password;

    public Admin() {
    }

    public Admin(int id, String email, String password) {
        this.id = id;
        this.email = email;
        this.password = password;
    }

    // Getters and setters

    @Override
    public String toString() {
        return "Admin [id=" + id + ", email=" + email + ", password=" + password + "]";
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

/*
 * Created by IntelliJ IDEA.
 * @author Bhathika Nilesh
 * @since 2023/12
 */
