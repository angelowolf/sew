/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.acciones;

import DAO.Candidato.CandidatoDAO;
import DAO.DAOFactory;
import DAO.Mesa.MesaDAO;
import DAO.VotosXMesaXCandidato.VotosXMesaXCandidatoDAO;
import DAO.MyException;
import Modelo.Negocio.Candidato;
import Modelo.Negocio.Mesa;
import Modelo.Negocio.VotosXMesaXCandidato;
import com.modelo.ResultadoCadaMesa;
import com.modelo.Total;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author angelo
 */
@Results({
    @Result(name = "success", location = "/resultadosFinales.jsp"),
    @Result(name = "error", location = "/error.jsp"),
    @Result(name = "none", location = "/index.jsp")})

public class ResultadoFinalAction extends ActionSupport {

    private List<Candidato> candidatos;

    private static final Logger logger = Logger.getLogger(ResultadoFinalAction.class);
    private List<Total> totales;
    private List<Mesa> mesas;
    List<ResultadoCadaMesa> resultadaDeCadaMesa;

    @Override
    @Action(value = "/ResultadoFinal")

    public String execute() {
        try {
            resultadaDeCadaMesa = new ArrayList<ResultadoCadaMesa>();
            DAOFactory d = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            VotosXMesaXCandidatoDAO daoVMC = d.getVotosXMesaXCandidato();
            CandidatoDAO daoCandidato = d.getCandidato();
            MesaDAO daoMesa = d.getMesaDAO();
            mesas = daoMesa.getMesas();
            candidatos = daoCandidato.getCandidatos();

            for (Mesa cadaMesa : mesas) {
                List<VotosXMesaXCandidato> votosPorMesa = daoVMC.getResultados(cadaMesa.getNumeroMesa());
                ResultadoCadaMesa rcm = new ResultadoCadaMesa();
                rcm.setNumeroMesa(cadaMesa.getNumeroMesa());
                rcm.setResultado(votosPorMesa);
                resultadaDeCadaMesa.add(rcm);
            }

            totales = new ArrayList<Total>();
            for (Candidato cadaCandidato : candidatos) {
                List<VotosXMesaXCandidato> votosPorCandidato = daoVMC.getResultadosPorCandidato(cadaCandidato.getIdCandidato());
                int total = 0;
                for (VotosXMesaXCandidato cadaVotoPorCandidato : votosPorCandidato) {
                    total += cadaVotoPorCandidato.getCantidad();
                }
                Total t = new Total();
                t.setTotal(total);
                totales.add(t);
            }

            return SUCCESS;
        } catch (MyException e) {
            logger.error("Error al cargar resultados finales.", e);
            return ERROR;
        }
    }

    public List<Candidato> getCandidatos() {
        return candidatos;
    }

    public List<ResultadoCadaMesa> getResultadaDeCadaMesa() {
        return resultadaDeCadaMesa;
    }

    public List<Total> getTotales() {
        return totales;
    }

}
