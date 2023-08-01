package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import DTO.UsersDto;

public class UsersDao {
    private String url = "jdbc:oracle:thin:@192.168.119.119:1521:db";
    private String username = "scott";
    private String password = "tiger";
    public UsersDao() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
  
    public ArrayList<UsersDto> memberSelect() {
        ArrayList<UsersDto> dtos = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM users";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int no = rs.getInt("m_no");
                String id = rs.getString("m_id");
                String pw = rs.getString("m_pw");
                String name = rs.getString("m_name");
                String phone = rs.getString("m_phone");
                String email = rs.getString("m_email");
                String enabled = rs.getString("m_enabled");
                String role = rs.getString("m_role");

                UsersDto dto = new UsersDto(no, id, pw, name, phone, email, enabled, role);
                dtos.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dtos;
    }

    // login
    public UsersDto login(String id, String pw) throws SQLException {
        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement pstm = null;
        ResultSet rs = null;
        UsersDto res = new UsersDto();
        
        String sql = "select * from users where m_id = ? and m_pw=? and m_enabled=?";
        
        
        try {
            con = DriverManager.getConnection(url, username, password);
            pstm = con.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.setString(2, pw);
            pstm.setString(3,"정상");
            
            rs = pstm.executeQuery();
           
            while(rs.next()) {
                res.setNo(rs.getInt(1));
                res.setId(rs.getString(2));
                res.setPw(rs.getString(3));
                res.setName(rs.getString(4));
                res.setPhone(rs.getString(5));
                res.setEmail(rs.getString(6));
                res.setEnabled(rs.getString(7));
                res.setRole(rs.getString(8));
      
            }
          
        }catch(SQLException e) {
            e.printStackTrace();
        } finally {
            rs.close();
            pstm.close();
            con.close();
        }
        return res;
        
    }
    
  

    // join
    public int insertUser(UsersDto dto) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        int res = 0;
        
        String sql = "insert into signup_requests values(mem_seq.nextval, ? ,?,?,?,?,'승인 전','일반사용자')";
        
        try {
            con = DriverManager.getConnection(url, username, password);
            pstm = con.prepareStatement(sql);
            pstm.setString(1, dto.getId());
            pstm.setString(2, dto.getPw());
            pstm.setString(3, dto.getName());
            pstm.setString(4, dto.getPhone());
            pstm.setString(5, dto.getEmail());
            
            res = pstm.executeUpdate();
            
            if(res > 0) {
                //con.commit(); 자동 커밋 설정되어 있음.
            }
           
        }catch(SQLException e) {
            e.printStackTrace();
        }finally {
            pstm.close();
            con.close();
        }
        
        return res;
    }
    
    // select
    public UsersDto selectUser(int no) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        UsersDto res = new UsersDto();
        String sql = "select * from users where m_no = ?";
        try {
            con = DriverManager.getConnection(url, username, password);
            
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, no);
            
            rs = pstm.executeQuery();
            
            
            while(rs.next()) {
                
                res.setNo(rs.getInt(1));
                res.setId(rs.getString(2));
                res.setPw(rs.getString(3));
                res.setName(rs.getString(4));
                res.setPhone(rs.getString(5));
                res.setEmail(rs.getString(6));
                res.setEnabled(rs.getString(7));
                res.setRole(rs.getString(8));
            }
        }catch(SQLException e) {
            e.printStackTrace();
        } finally {
            rs.close();
            pstm.close();
            con.close();
        }
        return res;
    }
    
    // 수정
    public boolean updateUser(UsersDto dto) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        int res = 0;
        
        String sql = "update users set m_pw = ?, m_email = ?, m_phone=? where m_no = ? ";
        
        try {
            con = DriverManager.getConnection(url, username, password);
            
            pstm = con.prepareStatement(sql);
            
            pstm.setString(1, dto.getPw());
            pstm.setString(2, dto.getEmail());
            pstm.setString(3, dto.getPhone());
//            pstm.setString(4, dto.getEnabled());
//            pstm.setString(5, dto.getRole());
            
            pstm.setInt(4, dto.getNo());
            
            res = pstm.executeUpdate();
            
            if(res>0) {
                //자동 커밋 되어있음
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            pstm.close();
            con.close();
        }
        return (res>0)?true:false;
        
    }
    
    public boolean updateUser2(UsersDto dto) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        int res = 0;
        
        String sql = "update users set m_pw = ?, m_email = ? where m_no = ? ";
        
        try {
            con = DriverManager.getConnection(url, username, password);
            
            pstm = con.prepareStatement(sql);
            
            pstm.setString(1, dto.getPw());
            pstm.setString(2, dto.getEmail());
//            pstm.setString(4, dto.getEnabled());
//            pstm.setString(5, dto.getRole());
            
            pstm.setInt(3, dto.getNo());
            
            res = pstm.executeUpdate();
            
            if(res>0) {
                //자동 커밋 되어있음
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            pstm.close();
            con.close();
        }
        return (res>0)?true:false;
        
    }
    
    // 관리자 기능

    
    
    // 아이디 중복체크
    public String idChk(String id) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String res = null;
        
        String sql = "select * from users where m_id = ?";
        
        try {
            con = DriverManager.getConnection(url, username, password);
            pstm = con.prepareStatement(sql);
            pstm.setString(1, id);
            
            rs = pstm.executeQuery();
            
            while(rs.next()) {
                res = rs.getString(2);
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }finally {
            rs.close();
            pstm.close();
            con.close();
        }
        return res;
    }
    
    // 회원가입 승인
    public void approveSignupRequest(int userId) {
        Connection con = null;
        PreparedStatement selectPstmt = null;
        PreparedStatement deletePstmt = null;
        PreparedStatement insertPstmt = null;
        
        try {
            con = DriverManager.getConnection(url, username, password);
            
            // 승인할 회원 정보 조회
            String selectSql = "SELECT * FROM signup_requests WHERE m_no = ?";
            selectPstmt = con.prepareStatement(selectSql);
            selectPstmt.setInt(1, userId);
            ResultSet rs = selectPstmt.executeQuery();
            
            if (rs.next()) {
                String id = rs.getString("m_id");
                String pw = rs.getString("m_pw");
                String name = rs.getString("m_name");
                String phone = rs.getString("m_phone");
                String email = rs.getString("m_email");
                
                // 회원 정보를 users 테이블에 삽입
                String insertSql = "INSERT INTO users VALUES (?, ?, ?, ?, ?, ?, '정상', '일반사용자')";
                insertPstmt = con.prepareStatement(insertSql);
                insertPstmt.setInt(1, userId);
                insertPstmt.setString(2, id);
                insertPstmt.setString(3, pw);
                insertPstmt.setString(4, name);
                insertPstmt.setString(5, phone);
                insertPstmt.setString(6, email);
                insertPstmt.executeUpdate();
                
                // 승인된 회원 정보를 signup_requests 테이블에서 삭제
                String deleteSql = "DELETE FROM signup_requests WHERE m_no = ?";
                deletePstmt = con.prepareStatement(deleteSql);
                deletePstmt.setInt(1, userId);
                deletePstmt.executeUpdate();
                
                // 추가 작업 또는 알림 등을 수행할 수 있습니다.
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (selectPstmt != null) {
                    selectPstmt.close();
                }
                if (deletePstmt != null) {
                    deletePstmt.close();
                }
                if (insertPstmt != null) {
                    insertPstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



    
    // 회원가입 승인 신청한 user 조회
    public ArrayList<UsersDto> joinmemberSelect() {
        ArrayList<UsersDto> dtos = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM signup_requests";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int no = rs.getInt("m_no");
                String id = rs.getString("m_id");
                String pw = rs.getString("m_pw");
                String name = rs.getString("m_name");
                String phone = rs.getString("m_phone");
                String email = rs.getString("m_email");
                String enabled = rs.getString("m_enabled");
                String role = rs.getString("m_role");

                UsersDto dto = new UsersDto(no, id, pw, name, phone, email, enabled, role);
                dtos.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dtos;
    }
    
    // 회원탈퇴 요청
    public boolean deleteUser(int userId) {
        Connection con = null;
        PreparedStatement selectPstmt = null;
        PreparedStatement deletePstmt = null;
        PreparedStatement insertPstmt = null;
        
        try {
            con = DriverManager.getConnection(url, username, password);
            
            // 삭제할 회원 정보 조회
            String selectSql = "SELECT * FROM users WHERE m_no = ?";
            selectPstmt = con.prepareStatement(selectSql);
            selectPstmt.setInt(1, userId);
            ResultSet rs = selectPstmt.executeQuery();
            
            if (rs.next()) {
                // 회원 정보를 userdelete 테이블에 삽입
                String insertSql = "INSERT INTO usersdelete (m_no, m_id, m_pw, m_name, m_phone, m_email, m_enabled, m_role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                insertPstmt = con.prepareStatement(insertSql);
                insertPstmt.setInt(1, rs.getInt("m_no"));
                insertPstmt.setString(2, rs.getString("m_id"));
                insertPstmt.setString(3, rs.getString("m_pw"));
                insertPstmt.setString(4, rs.getString("m_name"));
                insertPstmt.setString(5, rs.getString("m_phone"));
                insertPstmt.setString(6, rs.getString("m_email"));
                insertPstmt.setString(7, "일시정지");
                insertPstmt.setString(8, rs.getString("m_role"));
                insertPstmt.executeUpdate();
          
                
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (selectPstmt != null) {
                    selectPstmt.close();
                }
                if (deletePstmt != null) {
                    deletePstmt.close();
                }
                if (insertPstmt != null) {
                    insertPstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return false;
    }
    
    // 회원탈퇴 신청 목록
    public ArrayList<UsersDto> deletememberSelect() {
        ArrayList<UsersDto> dtos = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM usersdelete";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int no = rs.getInt("m_no");
                String id = rs.getString("m_id");
                String pw = rs.getString("m_pw");
                String name = rs.getString("m_name");
                String phone = rs.getString("m_phone");
                String email = rs.getString("m_email");
                String enabled = rs.getString("m_enabled");
                String role = rs.getString("m_role");

                UsersDto dto = new UsersDto(no, id, pw, name, phone, email, enabled, role);
                dtos.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dtos;
    }
    // 회원탈퇴 승인
    public void approveDeleteRequest(int userId) {
        Connection con = null;
        PreparedStatement selectPstmt = null;
        PreparedStatement deletePstmt = null;
        PreparedStatement insertPstmt = null;
        
        try {
            con = DriverManager.getConnection(url, username, password);
            
            // 승인할 회원 정보 조회
            String selectSql = "SELECT * FROM users WHERE m_no = ?";
            selectPstmt = con.prepareStatement(selectSql);
            selectPstmt.setInt(1, userId);
            ResultSet rs = selectPstmt.executeQuery();
            
            if (rs.next()) {
                String deleteSqlusers = "DELETE FROM users WHERE m_no = ?";
                deletePstmt = con.prepareStatement(deleteSqlusers);
                deletePstmt.setInt(1, userId);
                deletePstmt.executeUpdate();
                
                
                // 승인된 회원 정보를 usersdelete 테이블에서 삭제
                String deleteSql = "DELETE FROM usersdelete WHERE m_no = ?";
                deletePstmt = con.prepareStatement(deleteSql);
                deletePstmt.setInt(1, userId);
                deletePstmt.executeUpdate();
                
                // 추가 작업 또는 알림 등을 수행할 수 있습니다.
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (selectPstmt != null) {
                    selectPstmt.close();
                }
                if (deletePstmt != null) {
                    deletePstmt.close();
                }
                if (insertPstmt != null) {
                    insertPstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    // 관리자가 회원 수정
    public boolean updateUser(int no, String id, String pw, String name, String phone, String email, String enabled, String role) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isUpdated = false;
        
        try {
            conn = DriverManager.getConnection(url, username, password);
            String query = "UPDATE users SET id=?, pw=?, name=?, phone=?, email=? WHERE no=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            pstmt.setString(3, name);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
//            pstmt.setString(6, enabled);
//            pstmt.setString(7, role);
            pstmt.setInt(6, no);
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            System.out.println("관리자가 회원 수정 페이지로 넘어가고 있습니다.");
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return isUpdated;
    }
    
    public boolean changeEnabled(UsersDto dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        boolean result = false;
        String sql = "";
        try {
            conn = DriverManager.getConnection(url, username, password);
            
            
            String enabled = dto.getEnabled();
            if(enabled.equals("정상")) {
                 sql = "UPDATE users SET m_enabled = '일시정지' WHERE m_no = ?";
            }else if(enabled.equals("일시정지")) {
                 sql = "UPDATE users SET m_enabled = '정상' WHERE m_no = ?";
            }
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, dto.getNo());
            int row = pstmt.executeUpdate();
            
            if(row > 0) {
                result = true;
               
            }
            pstmt.close();
            conn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    
    public boolean changeRole(UsersDto dto) {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        boolean result = false;
        String sql = "";
                
        try {
            conn = DriverManager.getConnection(url, username, password);
            
            String role = dto.getRole();
            
            System.out.println(dto.getRole());
            System.out.println(dto.getNo());
            if(role.equals("관리자")) {
                sql = "UPDATE users SET m_role = '일반사용자' WHERE m_no = ?";
            }else if(role.equals("일반사용자")) {
                sql = "UPDATE users SET m_role = '관리자' WHERE m_no = ?";
            }
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, dto.getNo());
            
            int row = pstmt.executeUpdate();
            
            if(row > 0) {
                result = true;
               
            }
            pstmt.close();
            conn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }
  

}
