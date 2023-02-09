package Beans;

import Beans.ContaBean;
import Beans.RegistroBean;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-02-09T12:40:34")
@StaticMetamodel(CategoriaBean.class)
public class CategoriaBean_ { 

    public static volatile SingularAttribute<CategoriaBean, ContaBean> conta;
    public static volatile SetAttribute<CategoriaBean, RegistroBean> registros;
    public static volatile SingularAttribute<CategoriaBean, String> nome;
    public static volatile SingularAttribute<CategoriaBean, Long> id;

}