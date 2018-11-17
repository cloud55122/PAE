package co.edu.tdea.pae.model;

import javax.persistence.*;

@Entity
@Table(name = "encabezado_logistica_entrega")
public class EncabezadoLogisticaEntregaEntity {
    private Integer id;
    private String operador;
    private Boolean snProveedorLocal;
    private String nombreProveedor;
    private String identificacionProveedor;
    private String telefonoProveedor;
    private String direccionProveedor;
    private String fechaEntrega;
    private String horaInicio;
    private String horaFinal;
    private String responsableEntrega;
    private String responsableRecepcion;
    private String semanasEntregadas;
    private Integer diasEntregados;
    private String desde;
    private String hasta;
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
    @Column(name = "operador")
    public String getOperador() {
        return operador;
    }

    public void setOperador(String operador) {
        this.operador = operador;
    }

    @Basic
    @Column(name = "sn_proveedor_local")
    public Boolean getSnProveedorLocal() {
        return snProveedorLocal;
    }

    public void setSnProveedorLocal(Boolean snProveedorLocal) {
        this.snProveedorLocal = snProveedorLocal;
    }

    @Basic
    @Column(name = "nombre_proveedor")
    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    @Basic
    @Column(name = "identificacion_proveedor")
    public String getIdentificacionProveedor() {
        return identificacionProveedor;
    }

    public void setIdentificacionProveedor(String identificacionProveedor) {
        this.identificacionProveedor = identificacionProveedor;
    }

    @Basic
    @Column(name = "telefono_proveedor")
    public String getTelefonoProveedor() {
        return telefonoProveedor;
    }

    public void setTelefonoProveedor(String telefonoProveedor) {
        this.telefonoProveedor = telefonoProveedor;
    }

    @Basic
    @Column(name = "direccion_proveedor")
    public String getDireccionProveedor() {
        return direccionProveedor;
    }

    public void setDireccionProveedor(String direccionProveedor) {
        this.direccionProveedor = direccionProveedor;
    }

    @Basic
    @Column(name = "fecha_entrega")
    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    @Basic
    @Column(name = "hora_inicio")
    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    @Basic
    @Column(name = "hora_final")
    public String getHoraFinal() {
        return horaFinal;
    }

    public void setHoraFinal(String horaFinal) {
        this.horaFinal = horaFinal;
    }

    @Basic
    @Column(name = "responsable_entrega")
    public String getResponsableEntrega() {
        return responsableEntrega;
    }

    public void setResponsableEntrega(String responsableEntrega) {
        this.responsableEntrega = responsableEntrega;
    }

    @Basic
    @Column(name = "responsable_recepcion")
    public String getResponsableRecepcion() {
        return responsableRecepcion;
    }

    public void setResponsableRecepcion(String responsableRecepcion) {
        this.responsableRecepcion = responsableRecepcion;
    }

    @Basic
    @Column(name = "semanas_entregadas")
    public String getSemanasEntregadas() {
        return semanasEntregadas;
    }

    public void setSemanasEntregadas(String semanasEntregadas) {
        this.semanasEntregadas = semanasEntregadas;
    }

    @Basic
    @Column(name = "dias_entregados")
    public Integer getDiasEntregados() {
        return diasEntregados;
    }

    public void setDiasEntregados(Integer diasEntregados) {
        this.diasEntregados = diasEntregados;
    }

    @Basic
    @Column(name = "desde")
    public String getDesde() {
        return desde;
    }

    public void setDesde(String desde) {
        this.desde = desde;
    }

    @Basic
    @Column(name = "hasta")
    public String getHasta() {
        return hasta;
    }

    public void setHasta(String hasta) {
        this.hasta = hasta;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EncabezadoLogisticaEntregaEntity that = (EncabezadoLogisticaEntregaEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (operador != null ? !operador.equals(that.operador) : that.operador != null) return false;
        if (snProveedorLocal != null ? !snProveedorLocal.equals(that.snProveedorLocal) : that.snProveedorLocal != null)
            return false;
        if (nombreProveedor != null ? !nombreProveedor.equals(that.nombreProveedor) : that.nombreProveedor != null)
            return false;
        if (identificacionProveedor != null ? !identificacionProveedor.equals(that.identificacionProveedor) : that.identificacionProveedor != null)
            return false;
        if (telefonoProveedor != null ? !telefonoProveedor.equals(that.telefonoProveedor) : that.telefonoProveedor != null)
            return false;
        if (direccionProveedor != null ? !direccionProveedor.equals(that.direccionProveedor) : that.direccionProveedor != null)
            return false;
        if (fechaEntrega != null ? !fechaEntrega.equals(that.fechaEntrega) : that.fechaEntrega != null) return false;
        if (horaInicio != null ? !horaInicio.equals(that.horaInicio) : that.horaInicio != null) return false;
        if (horaFinal != null ? !horaFinal.equals(that.horaFinal) : that.horaFinal != null) return false;
        if (responsableEntrega != null ? !responsableEntrega.equals(that.responsableEntrega) : that.responsableEntrega != null)
            return false;
        if (responsableRecepcion != null ? !responsableRecepcion.equals(that.responsableRecepcion) : that.responsableRecepcion != null)
            return false;
        if (semanasEntregadas != null ? !semanasEntregadas.equals(that.semanasEntregadas) : that.semanasEntregadas != null)
            return false;
        if (diasEntregados != null ? !diasEntregados.equals(that.diasEntregados) : that.diasEntregados != null)
            return false;
        if (desde != null ? !desde.equals(that.desde) : that.desde != null) return false;
        return hasta != null ? hasta.equals(that.hasta) : that.hasta == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (operador != null ? operador.hashCode() : 0);
        result = 31 * result + (snProveedorLocal != null ? snProveedorLocal.hashCode() : 0);
        result = 31 * result + (nombreProveedor != null ? nombreProveedor.hashCode() : 0);
        result = 31 * result + (identificacionProveedor != null ? identificacionProveedor.hashCode() : 0);
        result = 31 * result + (telefonoProveedor != null ? telefonoProveedor.hashCode() : 0);
        result = 31 * result + (direccionProveedor != null ? direccionProveedor.hashCode() : 0);
        result = 31 * result + (fechaEntrega != null ? fechaEntrega.hashCode() : 0);
        result = 31 * result + (horaInicio != null ? horaInicio.hashCode() : 0);
        result = 31 * result + (horaFinal != null ? horaFinal.hashCode() : 0);
        result = 31 * result + (responsableEntrega != null ? responsableEntrega.hashCode() : 0);
        result = 31 * result + (responsableRecepcion != null ? responsableRecepcion.hashCode() : 0);
        result = 31 * result + (semanasEntregadas != null ? semanasEntregadas.hashCode() : 0);
        result = 31 * result + (diasEntregados != null ? diasEntregados.hashCode() : 0);
        result = 31 * result + (desde != null ? desde.hashCode() : 0);
        result = 31 * result + (hasta != null ? hasta.hashCode() : 0);
        return result;
    }

    @OneToOne(mappedBy = "encabezadoLogisticaEntrega")
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
