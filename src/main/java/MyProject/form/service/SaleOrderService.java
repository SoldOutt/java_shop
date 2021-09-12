package MyProject.form.service;

import org.springframework.stereotype.Service;

import MyProject.form.entities.SaleOrder;


@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}
	
}
