package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.OrdersDTO;

public class OrdersDAO extends JdbcDAO {
	private static OrdersDAO _dao;

	public OrdersDAO() {
		// TODO Auto-generated constructor stub
	}

	static {
		_dao = new OrdersDAO();
	}

	public static OrdersDAO getDAO() {
		return _dao;
	}

	public int insertOrders(OrdersDTO orders) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into Orders (idx, email, address_id, orders_date) values(? || TO_CHAR(orders_seq.nextval),?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orders.getEmail().substring(0, 5));
			pstmt.setString(2, orders.getEmail());
			pstmt.setString(3, orders.getAddress_id());
			pstmt.setString(4, orders.getOrder_date());
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Orders 테이블 insert 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int updateOrders(OrdersDTO orders) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update Orders set email = ?, address_id = ?, order_date = ?"
					+ ", pay_confirm = ?, delivery_confirm = ?, arrive_confirm = ? where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orders.getEmail());
			pstmt.setString(2, orders.getAddress_id());
			pstmt.setString(3, orders.getOrder_date());
			pstmt.setString(4, orders.getPay_confirm());
			pstmt.setString(5, orders.getDelivery_confirm());
			pstmt.setString(6, orders.getArrive_confirm());
			pstmt.setString(7, orders.getIdx());

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Orders 테이블 update 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int deleteOrders(String idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete from Orders where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Orders 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// select idx
	public OrdersDTO selectOrders(String idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrdersDTO orders = null;
		try {
			con = getConnection();

			String sql = "select * from Orders where idx = ? order by order_date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				orders = new OrdersDTO();
				orders.setIdx(rs.getString("idx"));
				orders.setEmail(rs.getString("email"));
				orders.setAddress_id(rs.getString("address_id"));
				orders.setOrder_date(rs.getString("order_date"));
				orders.setPay_confirm(rs.getString("pay_confirm"));
				orders.setDelivery_confirm(rs.getString("delivery_confirm"));
				orders.setArrive_confirm(rs.getString("arrive_confirm"));
			}
		} catch (SQLException e) {
			System.out.println("Orders 테이블 select 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orders;
	}

	// select email
	public OrdersDTO selectOrdersEmail(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrdersDTO orders = null;
		try {
			con = getConnection();

			String sql = "select * from Orders where email = ? order by order_date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				orders = new OrdersDTO();
				orders.setIdx(rs.getString("idx"));
				orders.setEmail(rs.getString("email"));
				orders.setAddress_id(rs.getString("address_id"));
				orders.setOrder_date(rs.getString("order_date"));
				orders.setPay_confirm(rs.getString("pay_confirm"));
				orders.setDelivery_confirm(rs.getString("delivery_confirm"));
				orders.setArrive_confirm(rs.getString("arrive_confirm"));
			}
		} catch (SQLException e) {
			System.out.println("Orders 테이블 selectEmail 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orders;
	}
	
	// select confirm
	public OrdersDTO selectOrdersConfirm(String pay_confirm, String delivery_confirm, String arrive_confirm) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrdersDTO orders = null;
		try {
			con = getConnection();

			String sql = "select * from Orders where pay_confirm = ? and delivery_confirm = ?"
					+ "and arrive_confirm = ? order by order_date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pay_confirm);
			pstmt.setString(2, delivery_confirm);
			pstmt.setString(3, arrive_confirm);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				orders = new OrdersDTO();
				orders.setIdx(rs.getString("idx"));
				orders.setEmail(rs.getString("email"));
				orders.setAddress_id(rs.getString("address_id"));
				orders.setOrder_date(rs.getString("order_date"));
				orders.setPay_confirm(rs.getString("pay_confirm"));
				orders.setDelivery_confirm(rs.getString("delivery_confirm"));
				orders.setArrive_confirm(rs.getString("arrive_confirm"));
			}
		} catch (SQLException e) {
			System.out.println("Orders 테이블 selectConfirm 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orders;
	}	
	
	// search email
	public OrdersDTO searchOrdersEmail(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrdersDTO orders = null;
		try {
			con = getConnection();

			String sql = "select * from Orders where email like '%'||?||'%' order by order_date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				orders = new OrdersDTO();
				orders.setIdx(rs.getString("idx"));
				orders.setEmail(rs.getString("email"));
				orders.setAddress_id(rs.getString("address_id"));
				orders.setOrder_date(rs.getString("order_date"));
				orders.setPay_confirm(rs.getString("pay_confirm"));
				orders.setDelivery_confirm(rs.getString("delivery_confirm"));
				orders.setArrive_confirm(rs.getString("arrive_confirm"));
			}
		} catch (SQLException e) {
			System.out.println("Orders 테이블 searchEmail 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orders;
	}
	
	// select *
	public List<OrdersDTO> selectAllOrdersList(String orderBy) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrdersDTO> list = new ArrayList<OrdersDTO>();
		try {
			con = getConnection();

			String sql = "select * from Orders order by ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderBy);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrdersDTO orders = new OrdersDTO();
				orders.setIdx(rs.getString("idx"));
				orders.setEmail(rs.getString("email"));
				orders.setAddress_id(rs.getString("address_id"));
				orders.setOrder_date(rs.getString("order_date"));
				orders.setPay_confirm(rs.getString("pay_confirm"));
				orders.setDelivery_confirm(rs.getString("delivery_confirm"));
				orders.setArrive_confirm(rs.getString("arrive_confirm"));
				list.add(orders);
			}
		} catch (SQLException e) {
			System.out.println("Orders 테이블 selectAll 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}
