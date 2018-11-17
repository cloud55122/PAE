package co.edu.tdea.pae.model;

import javax.persistence.*;

@Entity
@Table(name = "configuracion")
public class ConfiguracionEntity {
    private String nombre;
    private String valor;

    @Id
    @Column(name = "nombre")
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Basic
    @Column(name = "valor")
    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ConfiguracionEntity that = (ConfiguracionEntity) o;

        if (nombre != null ? !nombre.equals(that.nombre) : that.nombre != null) return false;
        return valor != null ? valor.equals(that.valor) : that.valor == null;

    }

    @Override
    public int hashCode() {
        int result = nombre != null ? nombre.hashCode() : 0;
        result = 31 * result + (valor != null ? valor.hashCode() : 0);
        return result;
    }
}
