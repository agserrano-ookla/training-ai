-- Mock data for the blog database schema
-- This file contains sample data to demonstrate the database structure and relationships

-- Insert sample users
INSERT INTO public.users (id, email, first_name, last_name, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'alice.johnson@email.com', 'Alice', 'Johnson', '2023-01-15 10:30:00'),
('550e8400-e29b-41d4-a716-446655440002', 'bob.smith@email.com', 'Bob', 'Smith', '2023-02-20 14:45:00'),
('550e8400-e29b-41d4-a716-446655440003', 'carol.williams@email.com', 'Carol', 'Williams', '2023-03-10 09:15:00'),
('550e8400-e29b-41d4-a716-446655440004', 'david.brown@email.com', 'David', 'Brown', '2023-04-05 16:20:00'),
('550e8400-e29b-41d4-a716-446655440005', 'eva.davis@email.com', 'Eva', 'Davis', '2023-05-12 11:00:00'),
('550e8400-e29b-41d4-a716-446655440006', 'frank.miller@email.com', 'Frank', 'Miller', '2023-06-18 13:30:00');

-- Insert sample blog posts
INSERT INTO public.posts (id, author_id, category, title, created_at) VALUES
-- Alice's posts
('650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'tutorial', 'Getting Started with PostgreSQL: A Beginner''s Guide', '2023-07-01 10:00:00'),
('650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'opinion', 'Why Database Design Matters More Than You Think', '2023-08-15 14:30:00'),
('650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', 'review', 'Review: Top 5 Database Management Tools in 2023', '2023-09-20 09:45:00'),

-- Bob's posts
('650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 'tutorial', 'Advanced SQL Queries: Window Functions Explained', '2023-07-10 11:15:00'),
('650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', 'tutorial', 'Building RESTful APIs with Node.js and Express', '2023-08-05 16:20:00'),

-- Carol's posts
('650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440003', 'opinion', 'The Future of Web Development: Trends to Watch', '2023-07-25 12:00:00'),
('650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440003', 'review', 'Comparing Frontend Frameworks: React vs Vue vs Angular', '2023-09-10 15:30:00'),

-- David's posts
('650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440004', 'tutorial', 'Docker for Developers: Complete Setup Guide', '2023-08-20 10:45:00'),

-- Eva's posts
('650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440005', 'opinion', 'Remote Work: Lessons Learned from 3 Years of WFH', '2023-09-05 13:15:00'),
('650e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440005', 'tutorial', 'Git Workflow Best Practices for Team Collaboration', '2023-09-25 11:30:00');

-- Frank has no posts yet (demonstrates users with 0 posts in the view)

-- Insert sample comments
INSERT INTO public.post_comments (id, post_id, author_id, content, created_at) VALUES
-- Comments on Alice's PostgreSQL tutorial
('750e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Great tutorial! Really helped me understand the basics.', '2023-07-02 09:30:00'),
('750e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', 'Thanks for sharing this. The examples are very clear.', '2023-07-02 14:15:00'),
('750e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440004', 'Could you do a follow-up on advanced queries?', '2023-07-03 11:20:00'),
('750e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440005', 'Bookmarked for future reference!', '2023-07-04 16:45:00'),

-- Comments on Alice's database design opinion
('750e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', 'Couldn''t agree more! I''ve seen so many projects fail due to poor DB design.', '2023-08-16 10:00:00'),
('750e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440006', 'Interesting perspective. What tools do you recommend for DB modeling?', '2023-08-17 13:30:00'),

-- Comments on Bob's window functions tutorial
('750e8400-e29b-41d4-a716-446655440007', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440001', 'This is exactly what I needed! Window functions were always confusing to me.', '2023-07-11 08:45:00'),
('750e8400-e29b-41d4-a716-446655440008', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', 'The examples with ROW_NUMBER() are particularly helpful.', '2023-07-12 15:20:00'),
('750e8400-e29b-41d4-a716-446655440009', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440005', 'More advanced SQL content please!', '2023-07-13 12:10:00'),

-- Comments on Bob's Node.js API tutorial
('750e8400-e29b-41d4-a716-446655440010', '650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440004', 'Solid tutorial. The authentication section was particularly useful.', '2023-08-06 09:15:00'),

-- Comments on Carol's web development trends
('750e8400-e29b-41d4-a716-446655440011', '650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440001', 'Interesting insights! What do you think about WebAssembly?', '2023-07-26 14:00:00'),
('750e8400-e29b-41d4-a716-446655440012', '650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440005', 'The section on AI integration in web apps was eye-opening.', '2023-07-27 11:30:00'),

-- Comments on Carol's framework comparison
('750e8400-e29b-41d4-a716-446655440013', '650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440002', 'Great comparison! I''ve been trying to decide between React and Vue.', '2023-09-11 10:20:00'),
('750e8400-e29b-41d4-a716-446655440014', '650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440004', 'The performance benchmarks are really helpful.', '2023-09-12 16:45:00'),
('750e8400-e29b-41d4-a716-446655440015', '650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440006', 'Would love to see a similar comparison for backend frameworks.', '2023-09-13 13:15:00'),

-- Comments on David's Docker tutorial
('750e8400-e29b-41d4-a716-446655440016', '650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440003', 'Finally understood Docker after reading this!', '2023-08-21 09:00:00'),
('750e8400-e29b-41d4-a716-446655440017', '650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440005', 'The multi-stage build example was perfect.', '2023-08-22 14:30:00'),

-- Comments on Eva's remote work opinion
('750e8400-e29b-41d4-a716-446655440018', '650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440001', 'So relatable! The communication challenges are real.', '2023-09-06 11:45:00'),

-- Comments on Eva's Git workflow tutorial
('750e8400-e29b-41d4-a716-446655440019', '650e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440002', 'This should be required reading for all developers!', '2023-09-26 08:30:00'),
('750e8400-e29b-41d4-a716-446655440020', '650e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440004', 'The branching strategy section is gold.', '2023-09-27 15:00:00');

-- Some posts have no comments (like Alice's review post) to demonstrate variety in the data

-- Display summary statistics
SELECT 'Mock data inserted successfully!' as status;
SELECT
    (SELECT COUNT(*) FROM public.users) as total_users,
    (SELECT COUNT(*) FROM public.posts) as total_posts,
    (SELECT COUNT(*) FROM public.post_comments) as total_comments;
