package main;

import dao.PessoaDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import model.Pessoa;
import ui.frmPrincipal;

/**
 *
 * @author André Schwerz
 */
public class Main {
    public static void main(String[] args) throws SQLException, ClassNotFoundException, IOException, ParseException  {
       new frmPrincipal().setVisible(true);
//       Pessoa p = new Pessoa("54455435", "thais", "ksbd@shd.com", "1511558", "sdasdasdasd", null);
//       PessoaDAO daop = new PessoaDAO();
//       daop.insert(p);
//        System.out.println("Pessoa: " + daop.find("54455435").getEmail());
    }   
}
