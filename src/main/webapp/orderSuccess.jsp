<%-- 
    Document   : order
    Created on : Feb 7, 2017, 3:13:05 PM
    Author     : John Phillips
--%>

<%@page import="pizzamvc.PizzaOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Devin's JSP Pizza Order</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <h1>Thank you for your order!</h1>
        <h2>Order details:</h2>
        <p>Email = ${myOrder.email}</p>
        <p>Size = ${myOrder.size}</p>
        <p>Toppings: 
            <%
                double total = 0;
                String crust = request.getParameter("crust");
                String size = request.getParameter("size");
                
            if (size.equalsIgnoreCase("large")){
                total = total + 7.00;
            } else if (size.equalsIgnoreCase("medium")){
                total = total + 6.00;
            } else if (size.equalsIgnoreCase("small")){
                total = total + 5.00;
            }
            
            if(crust.equalsIgnoreCase("pan")){
                total = total + 1.00;
            } else if(crust.equalsIgnoreCase("hand")){
                total = total + .50;
            }
                // Checkboxes from a form may or may not be checked. We can use the
                // following code to get an array of the values that are checked.
                PizzaOrder po = (PizzaOrder) request.getAttribute("myOrder");
                if (po.getToppings() != null && po.getToppings().length != 0) {
                    for (String myTopping : po.getToppings()) {
                        out.println(myTopping + ", ");
                        total += .75;
                    }
                } else {
                    out.println(" no toppings were requested");
                }
                out.println("<p>Total: $" + total + "</p>");
            %>
        </p>
        <p><a href='home.html'>Return to home page</a></p>
    </body>
</html>
