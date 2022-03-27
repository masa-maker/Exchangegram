package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginLogic;
import model.Mutter;
import model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String pass= request.getParameter("pass");
		
		
		//Userインスタンスを生成
		User user = new User(name, pass);
		
		//ログイン処理
		LoginLogic login = new LoginLogic();
		boolean isLogin = login.execute(user);
	
		if (isLogin) {
			//ログイン時にmutterlistがnullの場合は新規アプリケーションを作成し、取得する
			ServletContext application = this.getServletContext();
			List<Mutter> mutterList =
					(List<Mutter>) application.getAttribute("mutterlist");
			//Muteterリストを取得できなかった場合は、新規作成してアプリケーションスコープに保存
			if(mutterList == null) {
				mutterList = new ArrayList<>();
				application.setAttribute("mutterList", mutterList);
			}
			
			//ログインしているか確認するためセッションスコープからユーザを取得
			HttpSession session = request.getSession();
			User loginUser = (User) session.getAttribute("loginUser");
			
			if(loginUser == null) {
				//ログイン画面へリダイレクト
				request.setAttribute("errorMsg","ログイン情報を入力してください");
				response.sendRedirect("/Exchangegram/");
			} else {
				//ログイン済みの場合
				RequestDispatcher dispatcher =
						request.getRequestDispatcher("WEB-INF/jsp/main.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

}
