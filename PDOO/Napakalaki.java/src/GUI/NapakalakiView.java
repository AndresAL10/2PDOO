package GUI;

import NapakalakiGame.*;
/**
 *
 * @author Andres Arco Lopez y Miguel Angel Cantarero Lopez
 */
public class NapakalakiView extends javax.swing.JFrame {

    /**
     * Creates new form NapakalakiView
     */
    
    Napakalaki napakalakiModel;
 
    public NapakalakiView() {
        initComponents();
        
        monsterView.setEnabled(false);
        combat.setEnabled(false);
        nextTurn.setEnabled(false);
        
        repaint();
    }
    
    public void setNapakalaki(Napakalaki n){
        napakalakiModel = n;
        this.playerView.setPlayer(napakalakiModel.getCurrentPlayer());
        this.monsterView.setMonster(napakalakiModel.getCurrentMonster());
        
        this.playerView.setNapakalakiGame(napakalakiModel);
        this.monsterView.setVisible(false);
        nextTurn.setEnabled(false);
        combat.setEnabled(false);
        repaint();
        revalidate();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        playerView1 = new GUI.PlayerView();
        meetMonster = new javax.swing.JButton();
        nextTurn = new javax.swing.JButton();
        combat = new javax.swing.JButton();
        monsterView = new GUI.MonsterView();
        playerView = new GUI.PlayerView();
        gameResult = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        meetMonster.setText("Meet Monster");
        meetMonster.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                meetMonsterActionPerformed(evt);
            }
        });

        nextTurn.setText("NextTurn");
        nextTurn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                nextTurnActionPerformed(evt);
            }
        });

        combat.setText("Combat");
        combat.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                combatActionPerformed(evt);
            }
        });

        gameResult.setBackground(new java.awt.Color(197, 188, 179));
        gameResult.setFont(new java.awt.Font("IPAexGothic", 0, 11)); // NOI18N
        gameResult.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        gameResult.setBorder(new javax.swing.border.MatteBorder(null));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(playerView, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(68, 68, 68)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                                    .addComponent(meetMonster, javax.swing.GroupLayout.PREFERRED_SIZE, 142, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGap(18, 18, 18)
                                    .addComponent(combat, javax.swing.GroupLayout.PREFERRED_SIZE, 139, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addComponent(monsterView, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addComponent(nextTurn, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(93, 93, 93))))
                    .addGroup(layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(gameResult, javax.swing.GroupLayout.PREFERRED_SIZE, 396, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(16, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(monsterView, javax.swing.GroupLayout.PREFERRED_SIZE, 351, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(15, 15, 15)
                        .addComponent(gameResult, javax.swing.GroupLayout.PREFERRED_SIZE, 77, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(meetMonster, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(combat, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(23, 23, 23)
                        .addComponent(nextTurn, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(playerView, javax.swing.GroupLayout.DEFAULT_SIZE, 603, Short.MAX_VALUE)))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void meetMonsterActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_meetMonsterActionPerformed
        monsterView.setVisible(true);
        playerView.deshabilitarBotones();
        combat.setEnabled(true);
        meetMonster.setEnabled(false);
    }//GEN-LAST:event_meetMonsterActionPerformed

    private void nextTurnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_nextTurnActionPerformed
        String mens;
        
        if(!napakalakiModel.nextTurn()){
            mens = "ERROR \nNo cumples las condiciones para pasar turno. ";
            mens += "\nO bien tienes más de 4 tesoros ocultos.";
            mens += "\nO bien te queda mal rollo por cumplir.";
            gameResult.setText(mens);
            nextTurn.setEnabled(true);
            meetMonster.setEnabled(false);
            combat.setEnabled(false);
        }else{
            nextTurn.setEnabled(false);
            monsterView.setVisible(false);
            combat.setEnabled(true);
            meetMonster.setEnabled(true);
            }
        this.playerView.setPlayer(napakalakiModel.getCurrentPlayer());
        this.monsterView.setMonster(napakalakiModel.getCurrentMonster());
       
        playerView.setPlayer(this.napakalakiModel.getCurrentPlayer());

        repaint();
        revalidate();
    }//GEN-LAST:event_nextTurnActionPerformed

    private void combatActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_combatActionPerformed
        CombatResult combatResult = this.napakalakiModel.developCombat();
        String mensaje;
        
        
        switch (combatResult) {
            case WINGAME : 
              mensaje = napakalakiModel.currentPlayer.getName();
              mensaje += "\n\n ¡¡¡ H A S   G A N A D O   L A   P A R T I D A !!!";
              break;
            case WIN :
              mensaje = "\n\n Ganaste el combate";
              break;
            case LOSE :
              mensaje = "Has perdido el combate, te toca cumplir el mal rollo";
              break;
            case LOSEANDCONVERT :
              mensaje= "Has perdido el combate, y te has convertido en sectario"; 
              mensaje += "\nNo obstante, tienes que cumplir el mal rollo"; 
            default:
                mensaje = "--------";
            
        }
        gameResult.setText(mensaje);
        
        playerView.habilitarBotones();
        playerView.setPlayer(this.napakalakiModel.getCurrentPlayer());
        
        combat.setEnabled(false);
        
        if(combatResult != CombatResult.WINGAME)
            this.nextTurn.setEnabled(true);
        
        meetMonster.setEnabled(false);
        
    }//GEN-LAST:event_combatActionPerformed

    /**
     * @param args the command line arguments
     */
    public void showView() {
        this.setVisible(true);
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton combat;
    private javax.swing.JLabel gameResult;
    private javax.swing.JButton meetMonster;
    private GUI.MonsterView monsterView;
    private javax.swing.JButton nextTurn;
    private GUI.PlayerView playerView;
    private GUI.PlayerView playerView1;
    // End of variables declaration//GEN-END:variables
}
