package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

		Connection con;

		public LikeDao(Connection con) {
			super();
			this.con = con;
		}
		
		public boolean insertLike(int pid, int uid) {
			
			boolean f = false;
			try {
				String q = "insert into liked(pid, uid) values(?,?)";
				PreparedStatement p = this.con.prepareStatement(q);
				
				p.setInt(1, pid);
				p.setInt(2, uid);
				p.executeUpdate();
				f = true;
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return f;
		}
		
		public int countLikeOnPost(int pid) {
			
			int count = 0;
			String q = "select count(*) from liked where pid = ?";
			try {
				PreparedStatement p = this.con.prepareStatement(q);
				p.setInt(1, pid);
				
				ResultSet rs = p.executeQuery();
				if(rs.next()){
					count = rs.getInt("count(*)");
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return count;
		}
		
		public boolean isLikedByUser(int pid, int uid) {
			
			boolean f = false;
			
			String q = "select * from liked where pid = ? and uid = ?";
			try {
				PreparedStatement p = this.con.prepareStatement(q);
				p.setInt(1, pid);
				p.setInt(2, uid);
				ResultSet rs = p.executeQuery();
				
				if(rs.next()) {
					f = true;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}
		
		public boolean deleteLike(int pid, int uid) {
			
			boolean f = true;
			String q = "delete from liked where pid = ? and uid = ?";
			try {
				PreparedStatement p = this.con.prepareStatement(q);
				p.setInt(1, pid);
				p.setInt(2, uid);
				
				p.executeUpdate();
				f = false;
			} catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}
		
}