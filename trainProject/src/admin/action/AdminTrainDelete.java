package admin.action;

import java.util.Map;

import controls.Controller;
import dao.TrainDao;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/deleteTrain.do")
public class AdminTrainDelete implements Controller, DataBinding {
	private TrainDao trainDao;
	public AdminTrainDelete setTrainDao(TrainDao trainDao) {
		this.trainDao = trainDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"id", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String id = (String) model.get("id");
		trainDao.deleteById(id);
		return "redirect:../admin/TrainList.do";
	}

}
