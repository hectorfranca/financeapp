package Beans;

import Beans.RegistroBean;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-10-24T10:12:39")
@StaticMetamodel(CategoriaBean.class)
public class CategoriaBean_ { 

    public static volatile SingularAttribute<CategoriaBean, Character> tipo;
    public static volatile SetAttribute<CategoriaBean, RegistroBean> registros;
    public static volatile SingularAttribute<CategoriaBean, String> nome;
    public static volatile SingularAttribute<CategoriaBean, Long> id;

}