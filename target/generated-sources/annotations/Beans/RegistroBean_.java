package Beans;

import Beans.CategoriaBean;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-11-07T15:23:52")
@StaticMetamodel(RegistroBean.class)
public class RegistroBean_ { 

    public static volatile SingularAttribute<RegistroBean, Character> tipo;
    public static volatile SingularAttribute<RegistroBean, Date> data;
    public static volatile SingularAttribute<RegistroBean, CategoriaBean> categoria;
    public static volatile SingularAttribute<RegistroBean, Double> valor;
    public static volatile SingularAttribute<RegistroBean, String> nome;
    public static volatile SingularAttribute<RegistroBean, Long> id;

}