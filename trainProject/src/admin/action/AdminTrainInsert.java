package admin.action;

import java.util.Map;

import controls.Controller;
import dao.TrainDao;
import dto.TrainVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/addTrain.do")
public class AdminTrainInsert implements Controller, DataBinding{
	private TrainDao trainDao;
	public AdminTrainInsert setTrainDao (TrainDao trainDao) {
		this.trainDao = trainDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"train", dto.TrainVO.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		TrainVO train = (TrainVO)model.get("train");
		if(train.getName() != null) {
			int result  = trainDao.insert(train);
			if(result != -1) {
				return  "redirect:../admin/TrainList.do";
			}
		}else {
			return "/admin/addTrain.jsp";
		}
		return null; 
	}

}
