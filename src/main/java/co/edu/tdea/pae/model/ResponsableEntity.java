package co.edu.tdea.pae.model;

import javax.persistence.*;
import java.awt.*;
import java.util.Arrays;

@Entity
@Table(name = "responsable")
public class ResponsableEntity {
    private Integer id;
    private String nombre;
    private String documentoIdentidad;
    private String cargo;
    private String telefono;
    private String email;
    private byte[] firma;
    private AreaEvaluadaEntity areaEvaluada;
    private Image firmaJasper;

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
    @Column(name = "nombre")
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Basic
    @Column(name = "documento_identidad")
    public String getDocumentoIdentidad() {
        return documentoIdentidad;
    }

    public void setDocumentoIdentidad(String documentoIdentidad) {
        this.documentoIdentidad = documentoIdentidad;
    }

    @Basic
    @Column(name = "cargo")
    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    @Basic
    @Column(name = "telefono")
    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "firma", columnDefinition = "mediumblob")
    public byte[] getFirma() {
        return firma;
    }

    public void setFirma(byte[] firma) {
        this.firma = firma;
    }

    @Transient
    public Image getFirmaJasper() {
        return firmaJasper;
    }

    public void setFirmaJasper(Image firmaJasper) {
        this.firmaJasper = firmaJasper;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ResponsableEntity that = (ResponsableEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (nombre != null ? !nombre.equals(that.nombre) : that.nombre != null) return false;
        if (documentoIdentidad != null ? !documentoIdentidad.equals(that.documentoIdentidad) : that.documentoIdentidad != null)
            return false;
        if (cargo != null ? !cargo.equals(that.cargo) : that.cargo != null) return false;
        if (telefono != null ? !telefono.equals(that.telefono) : that.telefono != null) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        return Arrays.equals(firma, that.firma);

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (nombre != null ? nombre.hashCode() : 0);
        result = 31 * result + (documentoIdentidad != null ? documentoIdentidad.hashCode() : 0);
        result = 31 * result + (cargo != null ? cargo.hashCode() : 0);
        result = 31 * result + (telefono != null ? telefono.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(firma);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_area_evaluada", referencedColumnName = "id")
    public AreaEvaluadaEntity getAreaEvaluada() {
        return areaEvaluada;
    }

    public void setAreaEvaluada(AreaEvaluadaEntity areaEvaluada) {
        this.areaEvaluada = areaEvaluada;
    }
}
