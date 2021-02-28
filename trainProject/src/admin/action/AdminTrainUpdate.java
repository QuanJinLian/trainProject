package admin.action;

import java.util.Map;

import controls.Controller;
import dao.TrainDao;
import dto.TrainVO;
import prepare.Component;
import prepare.DataBinding;

@Component("/train/admin/updateTrain.do")
public class AdminTrainUpdate implements Controller, DataBinding {
	private TrainDao trainDao;
	public AdminTrainUpdate setTrainDao(TrainDao trainDao) {
		this.trainDao = trainDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"id" , String.class,
				"train", dto.TrainVO.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		TrainVO train = (TrainVO)model.get("train");
		String id = (String) model.get("id");
		if( train.getName() != null) {
//			수정하기
			trainDao.update(train);
			return "redirect:../admin/TrainList.do";
		}else {
//			리스트 보기
			model.put("train", trainDao.selectOneById(id));
			return "/admin/adminTrainUpdateForm.jsp";
		}
		
	}

}
