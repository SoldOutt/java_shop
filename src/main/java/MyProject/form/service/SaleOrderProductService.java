package MyProject.form.service;

import org.springframework.stereotype.Service;


import MyProject.form.entities.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct> {
	@Override
	protected Class<SaleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProduct.class;
	}
}
