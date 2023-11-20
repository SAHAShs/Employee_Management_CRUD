package com.Employee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.List;

public class EmployeeBO {
	private static final String URL = "jdbc:mysql://localhost:3306/Employee";
	private static final String UNAME = "root";
	private static final String PASSWORD = "root";
	private Connection con;
	private PreparedStatement pstmt;
	private static final String INSERTQUERRY = "insert into `Employee_Data`(`FirstName`,`LastName`,`Email`,`PhoneNumber`,`Address`,`JobTitle`,`JoiningDate`,`Salary`,`Shift`,`Password`,`CompanyMailID`) values(?,?,?,?,?,?,?,?,?,?,?)";
	private static final String LOGQUERRY = "select * from `Employee_Data` where email=?";
	private static final String CMPQUERRY = "select * from `Employee_Data` where email=?";
	private static final String ALREADYEMP = "select * from `Employee_Data` where email=?";
	private static final String SEARCHEMP = "select * from `Employee_Data` where id=?";
	private static final String SEARCHALLEMP = "select * from `Employee_Data` where `JobTitle`=?";
	private static final String DELETEEMP = "DELETE from `Employee_Data` where `id`=?";
	private static final String UPDATEQUERRY = "UPDATE Employee_Data SET FirstName = ?, LastName = ?, Email = ?, PhoneNumber = ?, Address = ?, JobTitle = ?, JoiningDate = ?, Salary = ?, Shift = ?, Password = ?, CompanyMailID = ? WHERE id = ?";

	public EmployeeBO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(URL, UNAME, PASSWORD);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	boolean saveEmp(Employee e) {
		try {
			pstmt = con.prepareStatement(INSERTQUERRY);
			pstmt.setString(1, e.getFirstName());
			pstmt.setString(2, e.getLastName());
			pstmt.setString(3, e.getEmail());
			pstmt.setString(4, e.getPhoneNumber());
			pstmt.setString(5, e.getAddress());
			pstmt.setString(6, e.getJobTitle());
			pstmt.setString(7, e.getJoiningDate());
			pstmt.setString(8, e.getSalary());
			pstmt.setString(9, e.getShift());
			pstmt.setString(10, "password");
			pstmt.setString(11, (e.getFirstName() + "." + e.getLastName() + "@comapanyName.com"));
			int i = pstmt.executeUpdate();
			return i > 0;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}

	boolean validEmp(String email, String password) {
		try {
			pstmt = con.prepareStatement(LOGQUERRY);
			pstmt.setString(1, email);
			ResultSet res = pstmt.executeQuery();

			if (res.next()) {
				String actpas = res.getString(4);
				if (password.equals(actpas)) {
					return true;
				} else {
					return false;
				}

			} else {
				return false;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//		finally {
//			try {
//				if (pstmt != null) {
//					pstmt.close();
//				}
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//			try {
//				if (con != null) {
//					con.close();
//				}
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//
//		}
		return false;

	}

	String getCmpID(String email) {
		try {
			pstmt = con.prepareStatement(CMPQUERRY);
			pstmt.setString(1, email);
			ResultSet res = pstmt.executeQuery();

			if (res.next()) {
				return ("Email " + res.getString(12) + " password- " + res.getString(11));
			} else {
				return null;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//		finally {
//			try {
//				if (pstmt != null) {
//					pstmt.close();
//				}
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//			try {
//				if (con != null) {
//					con.close();
//				}
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//
//		}
		return null;

	}

	boolean validEmp(String email) {
		try {
			pstmt = con.prepareStatement(ALREADYEMP);
			pstmt.setString(1, email);
			ResultSet res = pstmt.executeQuery();
			if (res.next()) {
				return true;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//		finally {
//			try {
//				if (pstmt != null) {
//					pstmt.close();
//				}
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//			try {
//				if (con != null) {
//					con.close();
//				}
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//
//		}
		return false;

	}

	public int login() {
		return 0;

	}

	Employee EmpSearch(String empid) {
		try {
			pstmt = con.prepareStatement(SEARCHEMP);
			pstmt.setString(1, empid);
			ResultSet res = pstmt.executeQuery();
			Employee e = new Employee();
			while (res.next()) {
				// Create Employee objects from the ResultSet data and add to the list
				e.setId(res.getString(1));
				e.setFirstName(res.getString(2));
				e.setLastName(res.getString(3));
				e.setEmail(res.getString(4));
				e.setPhoneNumber(res.getString(5));
				e.setAddress(res.getString(6));
				e.setJobTitle(res.getString(7));
				e.setJoiningDate(res.getString(8));
				e.setSalary(res.getString(9));
				e.setShift(res.getString(10));
				e.setPassword(res.getString(11));
				e.setCompanyMailID(res.getString(12));
				return e;
			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//			finally {
//			try {
//				if (pstmt != null) {
//					pstmt.close();
//				}
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//			try {
//				if (con != null) {
//					con.close();
//				}
//			} catch (Exception e) {
//				System.out.println(e);
//			}
//
//		}
		return null;

	}

	public ArrayList<Employee> allEmpSearch(String name) {
		ArrayList<Employee> employees = new ArrayList<Employee>();
		try {
			if (name.equals("All")) {
				pstmt = con.prepareStatement("select * from `Employee_Data`");
			} else {
				pstmt = con.prepareStatement(SEARCHALLEMP);
				pstmt.setString(1, name);
			}

			ResultSet res = pstmt.executeQuery();
			while (res.next()) {
				Employee e = new Employee();
				e.setId(res.getString(1));
				e.setFirstName(res.getString(2));
				e.setLastName(res.getString(3));
				e.setEmail(res.getString(4));
				e.setPhoneNumber(res.getString(5));
				e.setAddress(res.getString(6));
				e.setJobTitle(res.getString(7));
				e.setJoiningDate(res.getString(8));
				e.setSalary(res.getString(9));
				e.setShift(res.getString(10));
				e.setPassword(res.getString(11));
				e.setCompanyMailID(res.getString(12));
				employees.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employees;
	}

	boolean UpdateEmp(Employee e, String id) {
		try {
			pstmt = con.prepareStatement(UPDATEQUERRY);
			pstmt.setString(1, e.getFirstName());
			pstmt.setString(2, e.getLastName());
			pstmt.setString(3, e.getEmail());
			pstmt.setString(4, e.getPhoneNumber());
			pstmt.setString(5, e.getAddress());
			pstmt.setString(6, e.getJobTitle());
			pstmt.setString(7, e.getJoiningDate());
			pstmt.setString(8, e.getSalary());
			pstmt.setString(9, e.getShift());
			pstmt.setString(10, e.getPassword());
			pstmt.setString(11, e.getCompanyMailID());
			pstmt.setString(12, id);
			int i = pstmt.executeUpdate();
			return i > 0;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}

	boolean deleteEmp(String id) {
		try {
			pstmt = con.prepareStatement(DELETEEMP);
			pstmt.setString(1, id);
			int i = pstmt.executeUpdate();
			return i > 0;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}

}
