package ui;

import dao.CursoDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.SwingConstants;
import javax.swing.event.ListSelectionEvent;
import javax.swing.table.DefaultTableCellRenderer;
import model.Curso;

public class CursoJDialog extends javax.swing.JDialog {

    boolean addRecord = false;
    Curso universal = new Curso();

    public CursoJDialog(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        try {
            loadRecords();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        JTableCursos = new javax.swing.JTable();
        jPanel1 = new javax.swing.JPanel();
        txtSigla = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txtNome = new javax.swing.JTextField();
        btnCancelar = new javax.swing.JButton();
        btnPesquisar = new javax.swing.JButton();
        btnCadastrar = new javax.swing.JButton();
        btnEditar = new javax.swing.JButton();
        btnRemover = new javax.swing.JButton();
        btnSalvar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("PAIS");
        setBounds(new java.awt.Rectangle(0, 15, 0, 0));
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        JTableCursos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null}
            },
            new String [] {
                "Sigla", "Nome"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(JTableCursos);
        if (JTableCursos.getColumnModel().getColumnCount() > 0) {
            JTableCursos.getColumnModel().getColumn(0).setResizable(false);
            JTableCursos.getColumnModel().getColumn(1).setResizable(false);
        }

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, 490, 215));

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)), " REGISTRO DE CURSO ", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Lucida Grande", 1, 13))); // NOI18N
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        txtSigla.setToolTipText("");
        txtSigla.setName("txtSigla"); // NOI18N
        txtSigla.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtSiglaKeyTyped(evt);
            }
        });
        jPanel1.add(txtSigla, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 40, 100, -1));

        jLabel1.setText("Nome:");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(23, 70, 70, 20));

        jLabel2.setText("Sigla:");
        jLabel2.setAlignmentX(1.0F);
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(23, 20, 70, 20));

        txtNome.setEnabled(false);
        txtNome.setName("txtNome"); // NOI18N
        txtNome.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtNomeKeyTyped(evt);
            }
        });
        jPanel1.add(txtNome, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 90, 440, -1));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 240, 490, 140));

        btnCancelar.setText("Cancelar");
        btnCancelar.setActionCommand("btnFechar");
        btnCancelar.setEnabled(false);
        btnCancelar.setPreferredSize(new java.awt.Dimension(90, 29));
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelarActionPerformed(evt);
            }
        });
        getContentPane().add(btnCancelar, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 390, 90, 40));

        btnPesquisar.setText("Pesquisar");
        btnPesquisar.setActionCommand("btnNovo");
        btnPesquisar.setPreferredSize(new java.awt.Dimension(90, 29));
        btnPesquisar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPesquisarActionPerformed(evt);
            }
        });
        getContentPane().add(btnPesquisar, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 390, 80, 40));

        btnCadastrar.setText("Cadastrar");
        btnCadastrar.setActionCommand("btnAlterar");
        btnCadastrar.setEnabled(false);
        btnCadastrar.setPreferredSize(new java.awt.Dimension(90, 29));
        btnCadastrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCadastrarActionPerformed(evt);
            }
        });
        getContentPane().add(btnCadastrar, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 390, 80, 40));

        btnEditar.setText("Editar");
        btnEditar.setActionCommand("btnRemover");
        btnEditar.setEnabled(false);
        btnEditar.setPreferredSize(new java.awt.Dimension(90, 29));
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });
        getContentPane().add(btnEditar, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 390, 80, 40));

        btnRemover.setText("Remover");
        btnRemover.setActionCommand("btnImprimir");
        btnRemover.setEnabled(false);
        btnRemover.setPreferredSize(new java.awt.Dimension(90, 29));
        btnRemover.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRemoverActionPerformed(evt);
            }
        });
        getContentPane().add(btnRemover, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 390, 80, 40));

        btnSalvar.setText("Salvar");
        btnSalvar.setEnabled(false);
        getContentPane().add(btnSalvar, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 390, 80, 40));

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void txtSiglaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtSiglaKeyTyped
        if (txtSigla.getText().length() >= 5 ) // limit textfield to 3 characters
            evt.consume();
        //enableButtons(true, true, true, true, true, true);
    }//GEN-LAST:event_txtSiglaKeyTyped

    private void txtNomeKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtNomeKeyTyped
        if (txtNome.getText().length() >= 100 )
            evt.consume();     
        //enableButtons(true, true, true, true, true, true);
    }//GEN-LAST:event_txtNomeKeyTyped

    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
        clearInputBoxes();
        enableButtons(true, false, false, false, false, false);
        enableFields(true, false);
    }//GEN-LAST:event_btnCancelarActionPerformed

    private void btnPesquisarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPesquisarActionPerformed
//        try {
//            loadRecords();
//        } catch (SQLException ex) {
//            Logger.getLogger(CursoJDialog.class.getName()).log(Level.SEVERE, null, ex);
//        }

        String sigla = txtSigla.getText();
        CursoDAO dao = new CursoDAO();
        Curso cur = new Curso();
        try {
            cur = dao.find(sigla);
        } catch (SQLException ex) {
            Logger.getLogger(CursoJDialog.class.getName()).log(Level.SEVERE, null, ex);
        }
        //Verifica se o objeto ja esta cadastrado
        if (cur == null) {//Nao esta
            enableButtons(true, true, false, false, false, false);
        }else{//Ja esta
            //universal.setSigla(cur.getSigla());
            //universal.setNome(cur.getNome());
            txtNome.setText(cur.getNome());
            enableButtons(true, false, true, true, false, false);
        }
    }//GEN-LAST:event_btnPesquisarActionPerformed

    private void btnCadastrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCadastrarActionPerformed
        addRecord = true;
        enableFields(true, true);
        enableButtons(false, false, false, false, true, true);
    }//GEN-LAST:event_btnCadastrarActionPerformed

    private void btnSalvarActionPerformed(java.awt.event.ActionEvent evt) {
        if (addRecord == true) {
            int dialogResult = JOptionPane.showConfirmDialog(null, "Você tem certeza que deseja salvar esse registro?", "Confirmação?", JOptionPane.YES_NO_OPTION);

            if (dialogResult == JOptionPane.YES_OPTION) {
                try {
                    addNew();
                    loadRecords();
                    enableFields(true, false);
                    enableButtons(true, false, true, true, false, false);
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
        } else {
            int dialogResult = JOptionPane.showConfirmDialog(null, "Você tem certeza que deseja alterar esse registro?", "Confirmação?", JOptionPane.YES_NO_OPTION);

            if (dialogResult == JOptionPane.YES_OPTION) {
                try {
                    updateRecord();
                    loadRecords();
                    enableFields(true, false);
                    enableButtons(true, true, true, true, true, true);
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
        }
    }
    
    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        addRecord = false;
        enableFields(false, true);
        enableButtons(false, false, false, false, true, true);
    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnRemoverActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRemoverActionPerformed
        int dialogResult = JOptionPane.showConfirmDialog(null, "Você tem certeza que deseja excluir esse registro?", "Confirmação?", JOptionPane.YES_NO_OPTION);

        if (dialogResult == JOptionPane.YES_OPTION) {
            try {
                deleteRecord();
                clearInputBoxes();
                loadRecords();
                enableButtons(true, false, false, false, false, false);
                enableFields(true, false);
            } catch (SQLException ex) {
                Logger.getLogger(CursoJDialog.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }//GEN-LAST:event_btnRemoverActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTable JTableCursos;
    private javax.swing.JButton btnCadastrar;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnPesquisar;
    private javax.swing.JButton btnRemover;
    private javax.swing.JButton btnSalvar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField txtNome;
    private javax.swing.JTextField txtSigla;
    // End of variables declaration//GEN-END:variables

    //boolean addRecord = true;

    private void clearInputBoxes() {
        txtSigla.setText("");
        txtNome.setText("");
    }

    private void addNew() throws SQLException {
        Curso c = new Curso();
        c.setSigla(txtSigla.getText());
        c.setNome(txtNome.getText());
        CursoDAO dao = new CursoDAO();
        System.out.println("PASSSSOUUUUU");
        dao.insert(c);
    }

    private void updateRecord() throws SQLException {
        Curso c = new Curso();
        c.setSigla(txtSigla.getText());
        c.setNome(txtNome.getText());
        CursoDAO dao = new CursoDAO();
        dao.update(c);
    }

    private void deleteRecord() throws SQLException {
        CursoDAO dao = new CursoDAO();
        dao.remove(txtSigla.getText());
    }

    private void loadRecords() throws SQLException {
        String sql = "SELECT sigla, nome FROM Cursos ORDER BY sigla";
        ResultSetTableModel tableModel = new ResultSetTableModel(sql);
        JTableCursos.setModel(tableModel);
        
        JTableCursos.getColumnModel().getColumn(0).setWidth(50);
        JTableCursos.getColumnModel().getColumn(0).setMinWidth(50);
        JTableCursos.getColumnModel().getColumn(0).setMaxWidth(50);
        
        JTableCursos.getSelectionModel().addListSelectionListener((ListSelectionEvent event) -> {
            try {
                if (JTableCursos.getSelectedRow() >= 0) {
                    Object s = JTableCursos.getValueAt(JTableCursos.getSelectedRow(), 0);
                    Object n = JTableCursos.getValueAt(JTableCursos.getSelectedRow(), 1);

                    txtSigla.setText(s.toString());
                    txtNome.setText(n.toString());
                    txtNome.setEnabled(true);
                    enableButtons(true, true, true, true, true, true);
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        });
        DefaultTableCellRenderer rightRenderer = new DefaultTableCellRenderer();
        rightRenderer.setHorizontalAlignment(SwingConstants.LEFT);
        JTableCursos.getColumnModel().getColumn(0).setCellRenderer(rightRenderer);
    }
    
    public void enableButtons(boolean pesquisar, boolean cadastrar, boolean editar, boolean remover, boolean salvar, boolean cancelar){
        btnPesquisar.setEnabled(pesquisar);
        btnCadastrar.setEnabled(cadastrar);
        btnEditar.setEnabled(editar);
        btnRemover.setEnabled(remover);
        btnSalvar.setEnabled(salvar);
        btnCancelar.setEnabled(cancelar);
    }

    private void enableFields(boolean sigla, boolean nome) {
        txtSigla.setEnabled(sigla);
        txtNome.setEnabled(nome);

    }
}