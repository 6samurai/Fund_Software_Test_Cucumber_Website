package webApp;

import appLayer.PaymentSystem;
import appLayer.Results;
import appLayer.enums.PaymentSystemInputs;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "webPortal")
public class webPortal extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String name = request.getParameter(PaymentSystemInputs.NAME.toString().toLowerCase());
        String address = request.getParameter(PaymentSystemInputs.ADDRESS.toString().toLowerCase());
        String card_types = request.getParameter(PaymentSystemInputs.CARD_TYPE.toString().toLowerCase());
        String card_number = request.getParameter(PaymentSystemInputs.CARD_NUMBER.toString().toLowerCase());
        String expiry_date = request.getParameter(PaymentSystemInputs.EXPIRY_DATE.toString().toLowerCase());
        String CVV_code = request.getParameter(PaymentSystemInputs.CVV_CODE.toString().toLowerCase());
        String amount = request.getParameter(PaymentSystemInputs.AMOUNT.toString().toLowerCase());

        PaymentSystem paymentSystem = new PaymentSystem(name,address,card_types,card_number,expiry_date,CVV_code,amount);

    /*    if(paymentSystem.systemPrcoess()==0){

            request.setAttribute("valid", "result");
            request.getRequestDispatcher("./webPortal.jsp").forward(request, response);

        } else if(paymentSystem.systemPrcoess()  ==1){
            request.setAttribute("invalid", "result");
            request.getRequestDispatcher("./webPortal.jsp").forward(request, response);

        } else{

            request.setAttribute("blank", "result");
            request.getRequestDispatcher("./webPortal.jsp").forward(request, response);
        }*/

        String list = "";
        String valid = "valid message";
        Results paymentSystemResults = paymentSystem.systemProcess();
        if(paymentSystemResults.paymentResults!=0) {
            for (String log: paymentSystemResults.logs ) {
                list = log ;
            }
            //     request.setAttribute("errorMessage", list);
            request.setAttribute("alertMsg", list);

        //    request.setAttribute("errorMessage", list);
           // request.setAttribute("alertMsg", list);
            RequestDispatcher rd=request.getRequestDispatcher("/webPortal.jsp");
            rd.include(request, response);
        } else{

            list = "The payment was successful;";

            request.setAttribute("successMessage", valid);
            request.setAttribute("alertMsg", "Transaction was successful");
        }


        request.getRequestDispatcher("./webPortal.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      /*  request.setAttribute("blank", "result");
        request.getRequestDispatcher("index.jsp").forward(request, response);*/
        //  request.getRequestDispatcher("./index.jsp").forward(request, response);
        request.setAttribute("errorMessage","Invalid login and password. Please try again in get");
        request.getRequestDispatcher("./webPortal.jsp").forward(request,response);
    }


}
