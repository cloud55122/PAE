package co.edu.tdea.pae.model;

import javax.persistence.*;

@Entity
@Table(name = "encabezado_transporte")
public class EncabezadoTransporteEntity {
    private Integer id;
    private String fechaVisita;
    private String operador;
    private String nombreProveedor;
    private String alimentoProvee;
    private String telefonoProveedor;
    private String direccionProveedor;
    private String transporteCabeceraMunicipal;
    private String transporteUnidadAplicativa;
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
    @Column(name = "fecha_visita")
    public String getFechaVisita() {
        return fechaVisita;
    }

    public void setFechaVisita(String fechaVisita) {
        this.fechaVisita = fechaVisita;
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
    @Column(name = "nombre_proveedor")
    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    @Basic
    @Column(name = "alimento_provee")
    public String getAlimentoProvee() {
        return alimentoProvee;
    }

    public void setAlimentoProvee(String alimentoProvee) {
        this.alimentoProvee = alimentoProvee;
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
    @Column(name = "transporte_cabecera_municipal")
    public String getTransporteCabeceraMunicipal() {
        return transporteCabeceraMunicipal;
    }

    public void setTransporteCabeceraMunicipal(String transporteCabeceraMunicipal) {
        this.transporteCabeceraMunicipal = transporteCabeceraMunicipal;
    }

    @Basic
    @Column(name = "transporte_unidad_aplicativa")
    public String getTransporteUnidadAplicativa() {
        return transporteUnidadAplicativa;
    }

    public void setTransporteUnidadAplicativa(String transporteUnidadAplicativa) {
        this.transporteUnidadAplicativa = transporteUnidadAplicativa;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EncabezadoTransporteEntity that = (EncabezadoTransporteEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (fechaVisita != null ? !fechaVisita.equals(that.fechaVisita) : that.fechaVisita != null) return false;
        if (operador != null ? !operador.equals(that.operador) : that.operador != null) return false;
        if (nombreProveedor != null ? !nombreProveedor.equals(that.nombreProveedor) : that.nombreProveedor != null)
            return false;
        if (alimentoProvee != null ? !alimentoProvee.equals(that.alimentoProvee) : that.alimentoProvee != null)
            return false;
        if (telefonoProveedor != null ? !telefonoProveedor.equals(that.telefonoProveedor) : that.telefonoProveedor != null)
            return false;
        if (direccionProveedor != null ? !direccionProveedor.equals(that.direccionProveedor) : that.direccionProveedor != null)
            return false;
        if (transporteCabeceraMunicipal != null ? !transporteCabeceraMunicipal.equals(that.transporteCabeceraMunicipal) : that.transporteCabeceraMunicipal != null)
            return false;
        return transporteUnidadAplicativa != null ? transporteUnidadAplicativa.equals(that.transporteUnidadAplicativa) : that.transporteUnidadAplicativa == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (fechaVisita != null ? fechaVisita.hashCode() : 0);
        result = 31 * result + (operador != null ? operador.hashCode() : 0);
        result = 31 * result + (nombreProveedor != null ? nombreProveedor.hashCode() : 0);
        result = 31 * result + (alimentoProvee != null ? alimentoProvee.hashCode() : 0);
        result = 31 * result + (telefonoProveedor != null ? telefonoProveedor.hashCode() : 0);
        result = 31 * result + (direccionProveedor != null ? direccionProveedor.hashCode() : 0);
        result = 31 * result + (transporteCabeceraMunicipal != null ? transporteCabeceraMunicipal.hashCode() : 0);
        result = 31 * result + (transporteUnidadAplicativa != null ? transporteUnidadAplicativa.hashCode() : 0);
        return result;
    }

    @OneToOne(mappedBy = "encabezadoTransporte")
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
