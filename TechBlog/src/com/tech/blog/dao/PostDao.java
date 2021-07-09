package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {

		private Connection con;

		public PostDao() {
			super();
		}

		public PostDao(Connection con) {
			super();
			this.con = con;
		}
		
		public ArrayList<Category> getAllCategories() {
			
			ArrayList<Category> list = new ArrayList<>();
			
			try {
				
				String q = "select * from categories";
				Statement st = this.con.createStatement();
				ResultSet set = st.executeQuery(q);
				
				while(set.next()) {
					
					int cid = set.getInt("cid");
					String name = set.getString("name");
					String description = set.getString("description");
					
					Category c = new Category(cid, name, description);
					list.add(c);
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public boolean savePost(Post p) {
			
			boolean f = false;
			
			try {
				String q = "insert into posts(pTitle, pContent, pCode, pPic, catId, userId) values(?,?,?,?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(q);
				pstmt.setString(1, p.getpTitle());
				pstmt.setString(2, p.getpContent());
				pstmt.setString(3, p.getpCode());
				pstmt.setString(4, p.getpPic());
				pstmt.setInt(5, p.getcatId());
				pstmt.setInt(6, p.getUserId());
			
				pstmt.executeUpdate();
				f = true;
				
			}catch(Exception e) {
		
				e.printStackTrace();
			}
			return f;
		}
		
		//getting all posts
		public List<Post> getAllPosts() {
			List<Post> list = new ArrayList<>();
			//fetch all the post	
			try {
				PreparedStatement p = con.prepareStatement("select * from posts order by pId desc");
				ResultSet set = p.executeQuery();
				while(set.next()) {
					Post post = new Post();
					post.setPid(set.getInt("pid"));
					post.setpTitle(set.getString("pTitle"));
					post.setpContent(set.getString("pContent"));
					post.setpCode(set.getString("pCode"));
					post.setpPic(set.getString("pPic"));
					post.setpDate(set.getTimestamp("pDate"));
					post.setcatId(set.getInt("catId"));
					post.setUserId(set.getInt("userId"));
					
					list.add(post);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		public List<Post> getPostByCatId(int catId) {
			List<Post> list = new ArrayList<>();
			//fetch all the post by categories Id
			try {
				PreparedStatement p = con.prepareStatement("select * from posts where catId = ?");
				p.setInt(1, catId);
				ResultSet set = p.executeQuery();
				while(set.next()) {
					Post post = new Post();
					post.setPid(set.getInt("pid"));
					post.setpTitle(set.getString("pTitle"));
					post.setpContent(set.getString("pContent"));
					post.setpCode(set.getString("pCode"));
					post.setpPic(set.getString("pPic"));
					post.setpDate(set.getTimestamp("pDate"));
					
					post.setcatId(catId);// catId is Coming from getPostByCatId parameter
					
					post.setUserId(set.getInt("userId"));
					
					list.add(post);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		//fetching post by post Id
		public Post getPostByPostId(int pId) {
			Post p = null;
			try {
				PreparedStatement st = this.con.prepareStatement("select * from posts where pid = ?");
				st.setInt(1, pId);
				ResultSet rs = st.executeQuery();
				
				if(rs.next()) {
					p = new Post();
					p.setPid(rs.getInt("pid"));
					p.setpTitle(rs.getString("pTitle"));
					p.setpContent(rs.getString("pContent"));
					p.setpCode(rs.getString("pCode"));
					p.setpPic(rs.getString("pPic"));
					p.setpDate(rs.getTimestamp("pDate"));
					
					p.setcatId(rs.getInt("catId"));// catId is Coming from getPostByCatId parameter
					
					p.setUserId(rs.getInt("userId"));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return p;
		}
}
