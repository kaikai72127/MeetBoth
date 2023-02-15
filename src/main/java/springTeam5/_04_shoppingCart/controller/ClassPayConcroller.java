package springTeam5._04_shoppingCart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Controller
public class ClassPayConcroller {

	// 綠界使用
	AllInOne all = new AllInOne("");
	AioCheckOutALL obj = new AioCheckOutALL();

	@PostMapping("/")
	@ResponseBody
	public String processConfirmAllAction(Integer total) {

		String meetBothNo = "MeetBothTTT";
		meetBothNo = meetBothNo + String.valueOf(0); //訂單流水號

		// 綠界
		// 參考的網站https://hackmd.io/@leonsnoopy/rJVzy9JuN#java%E4%B8%B2%E6%8E%A5%E6%B5%81%E7%A8%8B
		obj.setMerchantTradeNo(meetBothNo); // 綠界顯示的訂單編號-存一個String
		obj.setMerchantTradeDate("2017/01/01 08:05:23"); // 時間
		obj.setTotalAmount(String.valueOf(total)); // 綠界結帳的金額 ---轉成String
		obj.setTradeDesc("這是測試-------------------");
		obj.setItemName("MeetBoth 購物商城"); // 要放item的名稱 但我們沒有到他後台那些 所以先隨便放
		// 錯誤return跳轉的網址
		obj.setReturnURL("http://localhost:8080/MeetBoth/index.controller");
		obj.setChooseSubPayment("Credit"); // 預設選信用卡
		// 跳轉的Controller網址
		obj.setOrderResultURL("http://localhost:8080/MeetBoth/shoppingCartConfirm.controller"); // 綠界交易成功後要轉跳的網址
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);

		return form;

	}

}
