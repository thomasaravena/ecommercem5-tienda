package com.tienda.config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static Connection con = null;
    private static final String URL = "jdbc:postgresql://localhost:5432/ecommerce_m5";
    private static final String USER = "postgres";
    private static final String PASS = "asdf";

    public static Connection getConexion() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            if (con == null || con.isClosed()) {
                con = DriverManager.getConnection(URL, USER, PASS);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }
}