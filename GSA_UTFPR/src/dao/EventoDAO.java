package dao;

import model.Evento;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author henriko-bcc-utfpr-cm
 */
public class EventoDAO extends DbConnection {

    private Connection conn;
    private final String sqlInsert = "INSERT INTO Evento(sigla, nome, dataInicio, dataFim, curso) VALUES (?,?,?,?,?)";
    private final String sqlUpdate = "UPDATE Evento SET nome= ?, dataInicio= ?, dataFim= ?, curso= ? WHERE sigla = ?";
    private final String sqlRemove = "DELETE FROM Evento WHERE sigla = ?";
    private final String sqlList = "SELECT sigla, nome, dataInicio, dataFim, curso FROM Evento ORDER BY curso";
    private final String sqlFind = "SELECT sigla, nome, dataInicio, dataFim, curso FROM Evento WHERE sigla = ?";

    public void insert(Evento evento) throws SQLException {
        PreparedStatement ps = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlInsert);
            ps.setString(1, evento.getSigla());
            ps.setString(2, evento.getNome());
            ps.setString(3, evento.getDataInicioMySQL());
            ps.setString(4, evento.getDataFimMySQL());
            ps.setString(5, evento.getCurso().getSigla());
            ps.execute();
        } finally {
            ps.close();
            close(conn);
        }
    }

    public void update(Evento evento) throws SQLException {
        PreparedStatement ps = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlUpdate);
            ps.setString(1, evento.getSigla());
            ps.setString(2, evento.getNome());
            ps.setString(3, evento.getDataInicioMySQL());
            ps.setString(4, evento.getDataFimMySQL());
            ps.setString(5, evento.getCurso().getSigla());
            ps.execute();
        } finally {
            ps.close();
            close(conn);
        }
    }

    public void remove(String sigla) throws SQLException {
        PreparedStatement ps = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlRemove);
            ps.setString(1, sigla);
            ps.execute();
        } finally {
            ps.close();
            close(conn);
        }
    }

    public List<Evento> list() throws SQLException, ClassNotFoundException, ParseException, IOException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = connect();
            ps = conn.prepareStatement(sqlList);
            rs = ps.executeQuery();
            List<Evento> list = new ArrayList<>();
            Evento evento;
            
            CursoDAO cursoDAO = new CursoDAO();
            
            while (rs.next()) {
                evento = new Evento();
                evento.setSigla(rs.getString("sigla"));
                evento.setNome(rs.getString("nome"));
                evento.setDataInicioMySQL(rs.getString("dataInicio"));
                evento.setDataFimMySQL(rs.getString("dataFim"));
                evento.setCurso(cursoDAO.find(rs.getString("curso")));
                list.add(evento);
            }
            return list;
        } finally {
            rs.close();
            ps.close();
            close(conn);
        }
    }

    public Evento find(String sigla) throws SQLException, ParseException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn=connect();
            ps = conn.prepareStatement(sqlFind);
            ps.setString(1, sigla);
            rs = ps.executeQuery();
            Evento evento = new Evento();
            CursoDAO cursoDAO = new CursoDAO();

            if (rs.next()) {
                evento.setSigla(rs.getString("sigla"));
                evento.setNome(rs.getString("nome"));
                evento.setDataInicioMySQL(rs.getString("dataInicio"));
                evento.setDataFimMySQL(rs.getString("dataFim"));
                evento.setCurso(cursoDAO.find(rs.getString("curso")));
            }
            return evento;
        } finally {
            rs.close();
            ps.close();
            close(conn);
        }
    }
}