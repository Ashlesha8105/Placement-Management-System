using System;
using System.Configuration;
using System.Data.SqlClient;  // ✅ CHANGED: MySql.Data.MySqlClient → System.Data.SqlClient
using System.Security.Cryptography;
using System.Text;

namespace Placement_Portal
{
    public class DatabaseConnection
    {
        // 1. SQL Server Connection (Update your web.config connection string name)
        public static SqlConnection GetConnection()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);  // ✅ SqlConnection
            return con;
        }

        // 2. Password Hashing (OPTIONAL - our test data uses plaintext)
        // Use this if you want to implement hashing for new registrations
        public static string GetHash(string input)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(input));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}