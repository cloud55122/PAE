package co.edu.tdea.pae.model;

import javax.persistence.*;

@Entity
@Table(name = "encabezado_bodega")
public class EncabezadoBodegaEntity {
    private Integer id;
    private String modeloOperacion;
    private String nombreProveedor;
    private String identificacionProveedor;
    private String productoSuministra;
    private String tipoModalidad;
    private String telefonoProveedor;
    private String direccionProveedor;
    private String emailProveedor;
    private String fechaVisita;
    private String horaVisita;
    private String recibeVisita;
    private String realizaVisita;
    private String identificacionrecibeVisita;
    private String identificacionrealizaVisita;
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
    @Column(name = "modelo_operacion")
    public String getModeloOperacion() {
        return modeloOperacion;
    }

    public void setModeloOperacion(String modeloOperacion) {
        this.modeloOperacion = modeloOperacion;
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
    @Column(name = "producto_suministra")
    public String getProductoSuministra() {
        return productoSuministra;
    }

    public void setProductoSuministra(String productoSuministra) {
        this.productoSuministra = productoSuministra;
    }

    @Basic
    @Column(name = "tipo_modalidad")
    public String getTipoModalidad() {
        return tipoModalidad;
    }

    public void setTipoModalidad(String tipoModalidad) {
        this.tipoModalidad = tipoModalidad;
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
    @Column(name = "email_proveedor")
    public String getEmailProveedor() {
        return emailProveedor;
    }

    public void setEmailProveedor(String emailProveedor) {
        this.emailProveedor = emailProveedor;
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
    @Column(name = "hora_visita")
    public String getHoraVisita() {
        return horaVisita;
    }

    public void setHoraVisita(String horaVisita) {
        this.horaVisita = horaVisita;
    }

    @Basic
    @Column(name = "recibe_visita")
    public String getRecibeVisita() {
        return recibeVisita;
    }

    public void setRecibeVisita(String recibeVisita) {
        this.recibeVisita = recibeVisita;
    }


    @Basic
    @Column(name = "realiza_visita")
    public String getRealizaVisita() {
        return realizaVisita;
    }

    public void setRealizaVisita(String realizaVisita) {
        this.realizaVisita = realizaVisita;
    }

    @Basic
    @Column(name = "identificacion_realiza_visita")
    public String getIdentificacionrealizaVisita() {
        return identificacionrealizaVisita;
    }

    public void setIdentificacionrealizaVisita(String identificacionrealizaVisita) {
        this.identificacionrealizaVisita = identificacionrealizaVisita;
    }

    @Basic
    @Column(name = "identificacion_recibe_visita")
    public String getIdentificacionrecibeVisita() {
        return identificacionrecibeVisita;
    }

    public void setIdentificacionrecibeVisita(String identificacionrecibeVisita) {
        this.identificacionrecibeVisita = identificacionrecibeVisita;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EncabezadoBodegaEntity that = (EncabezadoBodegaEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (modeloOperacion != null ? !modeloOperacion.equals(that.modeloOperacion) : that.modeloOperacion != null)
            return false;
        if (nombreProveedor != null ? !nombreProveedor.equals(that.nombreProveedor) : that.nombreProveedor != null)
            return false;
        if (identificacionProveedor != null ? !identificacionProveedor.equals(that.identificacionProveedor) : that.identificacionProveedor != null)
            return false;
        if (productoSuministra != null ? !productoSuministra.equals(that.productoSuministra) : that.productoSuministra != null)
            return false;
        if (tipoModalidad != null ? !tipoModalidad.equals(that.tipoModalidad) : that.tipoModalidad != null)
            return false;
        if (telefonoProveedor != null ? !telefonoProveedor.equals(that.telefonoProveedor) : that.telefonoProveedor != null)
            return false;
        if (direccionProveedor != null ? !direccionProveedor.equals(that.direccionProveedor) : that.direccionProveedor != null)
            return false;
        if (fechaVisita != null ? !fechaVisita.equals(that.fechaVisita) : that.fechaVisita != null) return false;
        if (horaVisita != null ? !horaVisita.equals(that.horaVisita) : that.horaVisita != null) return false;
        if (recibeVisita != null ? !recibeVisita.equals(that.recibeVisita) : that.recibeVisita != null) return false;
        if (identificacionrecibeVisita != null ? !identificacionrecibeVisita.equals(that.identificacionrecibeVisita) : that.identificacionrecibeVisita != null) return false;
        if (identificacionrealizaVisita != null ? !identificacionrealizaVisita.equals(that.identificacionrealizaVisita) : that.identificacionrealizaVisita != null) return false;
        return (realizaVisita != null ? !realizaVisita.equals(that.realizaVisita) : that.realizaVisita != null);

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (modeloOperacion != null ? modeloOperacion.hashCode() : 0);
        result = 31 * result + (nombreProveedor != null ? nombreProveedor.hashCode() : 0);
        result = 31 * result + (identificacionProveedor != null ? identificacionProveedor.hashCode() : 0);
        result = 31 * result + (productoSuministra != null ? productoSuministra.hashCode() : 0);
        result = 31 * result + (tipoModalidad != null ? tipoModalidad.hashCode() : 0);
        result = 31 * result + (telefonoProveedor != null ? telefonoProveedor.hashCode() : 0);
        result = 31 * result + (direccionProveedor != null ? direccionProveedor.hashCode() : 0);
        result = 31 * result + (fechaVisita != null ? fechaVisita.hashCode() : 0);
        result = 31 * result + (horaVisita != null ? horaVisita.hashCode() : 0);
        result = 31 * result + (recibeVisita != null ? recibeVisita.hashCode() : 0);
        result = 31 * result + (realizaVisita != null ? realizaVisita.hashCode() : 0);
        result = 31 * result + (identificacionrecibeVisita != null ? identificacionrecibeVisita.hashCode() : 0);
        result = 31 * result + (identificacionrealizaVisita != null ? identificacionrealizaVisita.hashCode() : 0);

        return result;
    }

    @OneToOne(mappedBy = "encabezadoBodega")
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
