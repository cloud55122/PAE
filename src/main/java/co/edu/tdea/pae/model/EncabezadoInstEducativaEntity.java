package co.edu.tdea.pae.model;

import javax.persistence.*;

@Entity
@Table(name = "encabezado_inst_educativa")
public class EncabezadoInstEducativaEntity {
    private Integer id;
    private String corregimiento;
    private String fechaVisita;
    private String barrioOVereda;
    private String modeloOperacion;
    private String nombreInstEducativa;
    private String nombreSedeEducativa;
    private String codigoDane;
    private String nombreRector;
    private String telefonoRector;
    private String docenteEncargadoPrograma;
    private String telefonoDocenteEncargado;
    private String nombreManipuladorAlimento;
    private String telefonoManipuladorAlimento;
    private String profesionalRealizaVisita;
    private String cargoProfesionalVisita;
    private Integer ninosMatriPrimaria;
    private Integer ninosAtiendeRestaurante;
    private Boolean snMinutaMejorada;
    private String modalidadAtencion;
    private Integer cuposAtendidosGovernacion;
    private Integer cuposAtendidosMunicipio;
    private Integer escolaresMatriSecundaria;
    private Integer indigenas;
    private Integer desplazados;
    private Integer discapacitados;
    private Boolean snCoberturaPoblacionPae;
    private Boolean snExisteCobroParticipacion;
    private Integer valorCobroParticipacion;
    private AreaEvaluadaEntity areaEvaluada;
    private SubregionEntity subregion;
    private MunicipioEntity municipio;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "cupos_atendidos_municipio")
    public Integer getCuposAtendidosMunicipio() {
        return cuposAtendidosMunicipio;
    }

    public void setCuposAtendidosMunicipio(Integer cuposAtendidosMunicipio) {
        this.cuposAtendidosMunicipio = cuposAtendidosMunicipio;
    }

    @Basic
    @Column(name = "corregimiento")
    public String getCorregimiento() {
        return corregimiento;
    }

    public void setCorregimiento(String corregimiento) {
        this.corregimiento = corregimiento;
    }

    @Basic
    @Column(name = "fecha_visita")
    public String getFechaVisita() {
        return fechaVisita;
    }

    public void setFechaVisita(String fechaVisita) {
        this.fechaVisita = fechaVisita;
    }

    @Basic
    @Column(name = "barrio_o_vereda")
    public String getBarrioOVereda() {
        return barrioOVereda;
    }

    public void setBarrioOVereda(String barrioOVereda) {
        this.barrioOVereda = barrioOVereda;
    }

    @Basic
    @Column(name = "modelo_operacion")
    public String getModeloOperacion() {
        return modeloOperacion;
    }

    public void setModeloOperacion(String modeloOperacion) {
        this.modeloOperacion = modeloOperacion;
    }

    @Basic
    @Column(name = "nombre_inst_educativa")
    public String getNombreInstEducativa() {
        return nombreInstEducativa;
    }

    public void setNombreInstEducativa(String nombreInstEducativa) {
        this.nombreInstEducativa = nombreInstEducativa;
    }

    @Basic
    @Column(name = "nombre_sede_educativa")
    public String getNombreSedeEducativa() {
        return nombreSedeEducativa;
    }

    public void setNombreSedeEducativa(String nombreSedeEducativa) {
        this.nombreSedeEducativa = nombreSedeEducativa;
    }

    @Basic
    @Column(name = "codigo_dane")
    public String getCodigoDane() {
        return codigoDane;
    }

    public void setCodigoDane(String codigoDane) {
        this.codigoDane = codigoDane;
    }

    @Basic
    @Column(name = "nombre_rector")
    public String getNombreRector() {
        return nombreRector;
    }

    public void setNombreRector(String nombreRector) {
        this.nombreRector = nombreRector;
    }

    @Basic
    @Column(name = "telefono_rector")
    public String getTelefonoRector() {
        return telefonoRector;
    }

    public void setTelefonoRector(String telefonoRector) {
        this.telefonoRector = telefonoRector;
    }

    @Basic
    @Column(name = "docente_encargado_programa")
    public String getDocenteEncargadoPrograma() {
        return docenteEncargadoPrograma;
    }

    public void setDocenteEncargadoPrograma(String docenteEncargadoPrograma) {
        this.docenteEncargadoPrograma = docenteEncargadoPrograma;
    }

    @Basic
    @Column(name = "telefono_docente_encargado")
    public String getTelefonoDocenteEncargado() {
        return telefonoDocenteEncargado;
    }

    public void setTelefonoDocenteEncargado(String telefonoDocenteEncargado) {
        this.telefonoDocenteEncargado = telefonoDocenteEncargado;
    }

    @Basic
    @Column(name = "nombre_manipulador_alimento")
    public String getNombreManipuladorAlimento() {
        return nombreManipuladorAlimento;
    }

    public void setNombreManipuladorAlimento(String nombreManipuladorAlimento) {
        this.nombreManipuladorAlimento = nombreManipuladorAlimento;
    }

    @Basic
    @Column(name = "telefono_manipulador_alimento")
    public String getTelefonoManipuladorAlimento() {
        return telefonoManipuladorAlimento;
    }

    public void setTelefonoManipuladorAlimento(String telefonoManipuladorAlimento) {
        this.telefonoManipuladorAlimento = telefonoManipuladorAlimento;
    }

    @Basic
    @Column(name = "profesional_realiza_visita")
    public String getProfesionalRealizaVisita() {
        return profesionalRealizaVisita;
    }

    public void setProfesionalRealizaVisita(String profesionalRealizaVisita) {
        this.profesionalRealizaVisita = profesionalRealizaVisita;
    }

    @Basic
    @Column(name = "cargo_profesional_visita")
    public String getCargoProfesionalVisita() {
        return cargoProfesionalVisita;
    }

    public void setCargoProfesionalVisita(String cargoProfesionalVisita) {
        this.cargoProfesionalVisita = cargoProfesionalVisita;
    }

    @Basic
    @Column(name = "niños_matri_primaria")
    public Integer getNinosMatriPrimaria() {
        return ninosMatriPrimaria;
    }

    public void setNinosMatriPrimaria(Integer ninosMatriPrimaria) {
        this.ninosMatriPrimaria = ninosMatriPrimaria;
    }

    @Basic
    @Column(name = "niños_atiende_restaurante")
    public Integer getNinosAtiendeRestaurante() {
        return ninosAtiendeRestaurante;
    }

    public void setNinosAtiendeRestaurante(Integer ninosAtiendeRestaurante) {
        this.ninosAtiendeRestaurante = ninosAtiendeRestaurante;
    }

    @Basic
    @Column(name = "sn_minuta_mejorada")
    public Boolean getSnMinutaMejorada() {
        return snMinutaMejorada;
    }

    public void setSnMinutaMejorada(Boolean snMinutaMejorada) {
        this.snMinutaMejorada = snMinutaMejorada;
    }

    @Basic
    @Column(name = "modalidad_atencion")
    public String getModalidadAtencion() {
        return modalidadAtencion;
    }

    public void setModalidadAtencion(String modalidadAtencion) {
        this.modalidadAtencion = modalidadAtencion;
    }

    @Basic
    @Column(name = "cupos_atendidos_governacion")
    public Integer getCuposAtendidosGovernacion() {
        return cuposAtendidosGovernacion;
    }

    public void setCuposAtendidosGovernacion(Integer cuposAtendidosGovernacion) {
        this.cuposAtendidosGovernacion = cuposAtendidosGovernacion;
    }

    @Basic
    @Column(name = "escolares_matri_secundaria")
    public Integer getEscolaresMatriSecundaria() {
        return escolaresMatriSecundaria;
    }

    public void setEscolaresMatriSecundaria(Integer escolaresMatriSecundaria) {
        this.escolaresMatriSecundaria = escolaresMatriSecundaria;
    }

    @Basic
    @Column(name = "indigenas")
    public Integer getIndigenas() {
        return indigenas;
    }

    public void setIndigenas(Integer indigenas) {
        this.indigenas = indigenas;
    }

    @Basic
    @Column(name = "desplazados")
    public Integer getDesplazados() {
        return desplazados;
    }

    public void setDesplazados(Integer desplazados) {
        this.desplazados = desplazados;
    }

    @Basic
    @Column(name = "discapacitados")
    public Integer getDiscapacitados() {
        return discapacitados;
    }

    public void setDiscapacitados(Integer discapacitados) {
        this.discapacitados = discapacitados;
    }

    @Basic
    @Column(name = "sn_cobertura_poblacion_pae")
    public Boolean getSnCoberturaPoblacionPae() {
        return snCoberturaPoblacionPae;
    }

    public void setSnCoberturaPoblacionPae(Boolean snCoberturaPoblacionPae) {
        this.snCoberturaPoblacionPae = snCoberturaPoblacionPae;
    }

    @Basic
    @Column(name = "sn_existe_cobro_participacion")
    public Boolean getSnExisteCobroParticipacion() {
        return snExisteCobroParticipacion;
    }

    public void setSnExisteCobroParticipacion(Boolean snExisteCobroParticipacion) {
        this.snExisteCobroParticipacion = snExisteCobroParticipacion;
    }

    @Basic
    @Column(name = "valor_cobro_participacion")
    public Integer getValorCobroParticipacion() {
        return valorCobroParticipacion;
    }

    public void setValorCobroParticipacion(Integer valorCobroParticipacion) {
        this.valorCobroParticipacion = valorCobroParticipacion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EncabezadoInstEducativaEntity that = (EncabezadoInstEducativaEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (corregimiento != null ? !corregimiento.equals(that.corregimiento) : that.corregimiento != null)
            return false;
        if (fechaVisita != null ? !fechaVisita.equals(that.fechaVisita) : that.fechaVisita != null) return false;
        if (barrioOVereda != null ? !barrioOVereda.equals(that.barrioOVereda) : that.barrioOVereda != null)
            return false;
        if (modeloOperacion != null ? !modeloOperacion.equals(that.modeloOperacion) : that.modeloOperacion != null)
            return false;
        if (nombreInstEducativa != null ? !nombreInstEducativa.equals(that.nombreInstEducativa) : that.nombreInstEducativa != null)
            return false;
        if (nombreSedeEducativa != null ? !nombreSedeEducativa.equals(that.nombreSedeEducativa) : that.nombreSedeEducativa != null)
            return false;
        if (codigoDane != null ? !codigoDane.equals(that.codigoDane) : that.codigoDane != null) return false;
        if (nombreRector != null ? !nombreRector.equals(that.nombreRector) : that.nombreRector != null) return false;
        if (telefonoRector != null ? !telefonoRector.equals(that.telefonoRector) : that.telefonoRector != null)
            return false;
        if (docenteEncargadoPrograma != null ? !docenteEncargadoPrograma.equals(that.docenteEncargadoPrograma) : that.docenteEncargadoPrograma != null)
            return false;
        if (cuposAtendidosMunicipio != null ? !cuposAtendidosMunicipio.equals(that.cuposAtendidosMunicipio) : that.cuposAtendidosMunicipio != null)
            return false;
        if (telefonoDocenteEncargado != null ? !telefonoDocenteEncargado.equals(that.telefonoDocenteEncargado) : that.telefonoDocenteEncargado != null)
            return false;
        if (nombreManipuladorAlimento != null ? !nombreManipuladorAlimento.equals(that.nombreManipuladorAlimento) : that.nombreManipuladorAlimento != null)
            return false;
        if (telefonoManipuladorAlimento != null ? !telefonoManipuladorAlimento.equals(that.telefonoManipuladorAlimento) : that.telefonoManipuladorAlimento != null)
            return false;
        if (profesionalRealizaVisita != null ? !profesionalRealizaVisita.equals(that.profesionalRealizaVisita) : that.profesionalRealizaVisita != null)
            return false;
        if (cargoProfesionalVisita != null ? !cargoProfesionalVisita.equals(that.cargoProfesionalVisita) : that.cargoProfesionalVisita != null)
            return false;
        if (ninosMatriPrimaria != null ? !ninosMatriPrimaria.equals(that.ninosMatriPrimaria) : that.ninosMatriPrimaria != null)
            return false;
        if (ninosAtiendeRestaurante != null ? !ninosAtiendeRestaurante.equals(that.ninosAtiendeRestaurante) : that.ninosAtiendeRestaurante != null)
            return false;
        if (snMinutaMejorada != null ? !snMinutaMejorada.equals(that.snMinutaMejorada) : that.snMinutaMejorada != null)
            return false;
        if (modalidadAtencion != null ? !modalidadAtencion.equals(that.modalidadAtencion) : that.modalidadAtencion != null)
            return false;
        if (cuposAtendidosGovernacion != null ? !cuposAtendidosGovernacion.equals(that.cuposAtendidosGovernacion) : that.cuposAtendidosGovernacion != null)
            return false;
        if (escolaresMatriSecundaria != null ? !escolaresMatriSecundaria.equals(that.escolaresMatriSecundaria) : that.escolaresMatriSecundaria != null)
            return false;
        if (indigenas != null ? !indigenas.equals(that.indigenas) : that.indigenas != null) return false;
        if (desplazados != null ? !desplazados.equals(that.desplazados) : that.desplazados != null) return false;
        if (discapacitados != null ? !discapacitados.equals(that.discapacitados) : that.discapacitados != null)
            return false;
        if (snCoberturaPoblacionPae != null ? !snCoberturaPoblacionPae.equals(that.snCoberturaPoblacionPae) : that.snCoberturaPoblacionPae != null)
            return false;
        if (snExisteCobroParticipacion != null ? !snExisteCobroParticipacion.equals(that.snExisteCobroParticipacion) : that.snExisteCobroParticipacion != null)
            return false;
        return valorCobroParticipacion != null ? valorCobroParticipacion.equals(that.valorCobroParticipacion) : that.valorCobroParticipacion == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (corregimiento != null ? corregimiento.hashCode() : 0);
        result = 31 * result + (fechaVisita != null ? fechaVisita.hashCode() : 0);
        result = 31 * result + (barrioOVereda != null ? barrioOVereda.hashCode() : 0);
        result = 31 * result + (modeloOperacion != null ? modeloOperacion.hashCode() : 0);
        result = 31 * result + (nombreInstEducativa != null ? nombreInstEducativa.hashCode() : 0);
        result = 31 * result + (nombreSedeEducativa != null ? nombreSedeEducativa.hashCode() : 0);
        result = 31 * result + (codigoDane != null ? codigoDane.hashCode() : 0);
        result = 31 * result + (nombreRector != null ? nombreRector.hashCode() : 0);
        result = 31 * result + (telefonoRector != null ? telefonoRector.hashCode() : 0);
        result = 31 * result + (docenteEncargadoPrograma != null ? docenteEncargadoPrograma.hashCode() : 0);
        result = 31 * result + (telefonoDocenteEncargado != null ? telefonoDocenteEncargado.hashCode() : 0);
        result = 31 * result + (nombreManipuladorAlimento != null ? nombreManipuladorAlimento.hashCode() : 0);
        result = 31 * result + (telefonoManipuladorAlimento != null ? telefonoManipuladorAlimento.hashCode() : 0);
        result = 31 * result + (profesionalRealizaVisita != null ? profesionalRealizaVisita.hashCode() : 0);
        result = 31 * result + (cargoProfesionalVisita != null ? cargoProfesionalVisita.hashCode() : 0);
        result = 31 * result + (ninosMatriPrimaria != null ? ninosMatriPrimaria.hashCode() : 0);
        result = 31 * result + (ninosAtiendeRestaurante != null ? ninosAtiendeRestaurante.hashCode() : 0);
        result = 31 * result + (snMinutaMejorada != null ? snMinutaMejorada.hashCode() : 0);
        result = 31 * result + (modalidadAtencion != null ? modalidadAtencion.hashCode() : 0);
        result = 31 * result + (cuposAtendidosGovernacion != null ? cuposAtendidosGovernacion.hashCode() : 0);
        result = 31 * result + (escolaresMatriSecundaria != null ? escolaresMatriSecundaria.hashCode() : 0);
        result = 31 * result + (indigenas != null ? indigenas.hashCode() : 0);
        result = 31 * result + (desplazados != null ? desplazados.hashCode() : 0);
        result = 31 * result + (cuposAtendidosGovernacion != null ? cuposAtendidosGovernacion.hashCode() : 0);
        result = 31 * result + (discapacitados != null ? discapacitados.hashCode() : 0);
        result = 31 * result + (snCoberturaPoblacionPae != null ? snCoberturaPoblacionPae.hashCode() : 0);
        result = 31 * result + (snExisteCobroParticipacion != null ? snExisteCobroParticipacion.hashCode() : 0);
        result = 31 * result + (valorCobroParticipacion != null ? valorCobroParticipacion.hashCode() : 0);
        return result;
    }

    @OneToOne(mappedBy = "encabezadoInstEducativa")
    public AreaEvaluadaEntity getAreaEvaluada() {
        return areaEvaluada;
    }

    public void setAreaEvaluada(AreaEvaluadaEntity areaEvaluada) {
        this.areaEvaluada = areaEvaluada;
    }

    @ManyToOne
    @JoinColumn(name = "id_subregion", referencedColumnName = "id")
    public SubregionEntity getSubregion() {
        return subregion;
    }

    public void setSubregion(SubregionEntity subregion) {
        this.subregion = subregion;
    }

    @ManyToOne
    @JoinColumn(name = "id_municipio", referencedColumnName = "id")
    public MunicipioEntity getMunicipio() {
        return municipio;
    }

    public void setMunicipio(MunicipioEntity municipio) {
        this.municipio = municipio;
    }
}
