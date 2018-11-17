package co.edu.tdea.pae.model;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "aspecto_evaluado")
public class AspectoEvaluadoEntity {
    private Integer id;
    private String nombre;
    private Integer totalItemsCumplidos;
    private Integer totalItemsNoCumplidos;
    private Integer totalItemsNoAplica;
    private Integer totalItemsNoObserva;
    private BigDecimal porcentajeCumplimiento;
    private List<ItemEvaluadoEntity> itemEvaluados;
    private AreaEvaluadaEntity areaEvaluada;

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
    @Column(name = "total_items_cumple")
    public Integer getTotalItemsCumplidos() {
        return totalItemsCumplidos;
    }

    public void setTotalItemsCumplidos(Integer totalItemsCumplidos) {
        this.totalItemsCumplidos = totalItemsCumplidos;
    }
    @Basic
    @Column(name = "total_items_no_aplica")
    public Integer getTotalItemsNoAplica() {
        return totalItemsNoAplica;
    }

    public void setTotalItemsNoAplica(Integer totalItemsNoAplica) {
        this.totalItemsNoAplica = totalItemsNoAplica;
    }
    @Basic
    @Column(name = "total_items_no_observa")
    public Integer getTotalItemsNoObserva() {
        return totalItemsNoObserva;
    }

    public void setTotalItemsNoObserva(Integer totalItemsNoObserva) {
        this.totalItemsNoObserva = totalItemsNoObserva;
    }

    @Basic
    @Column(name = "total_items_no_cumple")
    public Integer getTotalItemsNoCumplidos() {
        return totalItemsNoCumplidos;
    }

    public void setTotalItemsNoCumplidos(Integer totalItemsNoCumplidos) {
        this.totalItemsNoCumplidos = totalItemsNoCumplidos;
    }

    @Basic
    @Column(name = "porcentaje_cumplimiento")
    public BigDecimal getPorcentajeCumplimiento() {
        return porcentajeCumplimiento;
    }

    public void setPorcentajeCumplimiento(BigDecimal porcentajeCumplimiento) {
        this.porcentajeCumplimiento = porcentajeCumplimiento;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AspectoEvaluadoEntity that = (AspectoEvaluadoEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (nombre != null ? !nombre.equals(that.nombre) : that.nombre != null) return false;
        if (totalItemsCumplidos != null ? !totalItemsCumplidos.equals(that.totalItemsCumplidos) : that.totalItemsCumplidos != null)
            return false;
        if (totalItemsNoAplica != null ? !totalItemsNoAplica.equals(that.totalItemsNoAplica) : that.totalItemsNoAplica != null)
            return false;
        if (totalItemsNoObserva != null ? !totalItemsNoObserva.equals(that.totalItemsNoObserva) : that.totalItemsNoObserva != null)
            return false;
        if (totalItemsNoCumplidos != null ? !totalItemsNoCumplidos.equals(that.totalItemsNoCumplidos) : that.totalItemsNoCumplidos != null)
            return false;
        return porcentajeCumplimiento != null ? porcentajeCumplimiento.equals(that.porcentajeCumplimiento) : that.porcentajeCumplimiento == null;

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (nombre != null ? nombre.hashCode() : 0);
        result = 31 * result + (totalItemsCumplidos != null ? totalItemsCumplidos.hashCode() : 0);
        result = 31 * result + (totalItemsNoCumplidos != null ? totalItemsNoCumplidos.hashCode() : 0);
        result = 31 * result + (porcentajeCumplimiento != null ? porcentajeCumplimiento.hashCode() : 0);
        result = 31 * result + (totalItemsNoObserva != null ? totalItemsNoObserva.hashCode() : 0);
        result = 31 * result + (totalItemsNoAplica != null ? totalItemsNoAplica.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "id_area_evaluada", referencedColumnName = "id", nullable = false)
    public AreaEvaluadaEntity getAreaEvaluada() {
        return areaEvaluada;
    }

    public void setAreaEvaluada(AreaEvaluadaEntity areaEvaluada) {
        this.areaEvaluada = areaEvaluada;
    }

    @OneToMany(mappedBy = "aspectoEvaluado", cascade = CascadeType.ALL, orphanRemoval = true)
    @LazyCollection(LazyCollectionOption.FALSE)
    public List<ItemEvaluadoEntity> getItemEvaluados() {
        return itemEvaluados;
    }

    public void setItemEvaluados(List<ItemEvaluadoEntity> itemEvaluados) {
        this.itemEvaluados = itemEvaluados;
    }
}
