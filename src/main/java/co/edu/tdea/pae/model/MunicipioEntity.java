package co.edu.tdea.pae.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "municipio")
public class MunicipioEntity {
    private Integer id;
    private String nombre;
    private Integer codigo;
    private SubregionEntity subregion;

    @Id
    @Column(name = "id")
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
    @Column(name = "codigo")
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MunicipioEntity that = (MunicipioEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (nombre != null ? !nombre.equals(that.nombre) : that.nombre != null) return false;
        if (codigo != null ? !codigo.equals(that.codigo) : that.codigo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (nombre != null ? nombre.hashCode() : 0);
        result = 31 * result + (codigo != null ? codigo.hashCode() : 0);
        return result;
    }

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "id_subregion", referencedColumnName = "id")
    public SubregionEntity getSubregion() {
        return subregion;
    }

    public void setSubregion(SubregionEntity subregion) {
        this.subregion = subregion;
    }
}
