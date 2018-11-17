package co.edu.tdea.pae.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "subregion")
public class SubregionEntity {
    private Integer id;
    private String nombre;
    private List<MunicipioEntity> municipios;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SubregionEntity that = (SubregionEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        return nombre != null ? nombre.equals(that.nombre) : that.nombre == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (nombre != null ? nombre.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "subregion")
    public List<MunicipioEntity> getMunicipios() {
        return municipios;
    }

    public void setMunicipios(List<MunicipioEntity> municipios) {
        this.municipios = municipios;
    }
}
