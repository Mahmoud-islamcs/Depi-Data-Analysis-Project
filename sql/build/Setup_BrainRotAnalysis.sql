Create database BrainRotAnalysis
use BrainRotAnalysis

-- 1
CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    age INT NOT NULL,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    occupation NVARCHAR(100),
    avg_sleep_hours DECIMAL(4,2),
    created_at DATETIME DEFAULT GETDATE()
);
GO

-- 2
CREATE TABLE Digital_Consumption (
    session_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    platform_name NVARCHAR(50),
    content_format VARCHAR(20) CHECK (content_format IN ('Short-form', 'Long-form', 'Static-Posts')),
    daily_usage_minutes INT,
    scrolling_speed_index INT CHECK (scrolling_speed_index BETWEEN 1 AND 10),
    CONSTRAINT FK_Consumption_Users FOREIGN KEY (user_id) 
        REFERENCES Users(user_id) ON DELETE CASCADE
);
GO

-- 3
CREATE TABLE Cognitive_Metrics (
    test_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    attention_span_score INT CHECK (attention_span_score BETWEEN 1 AND 100),
    memory_recall_accuracy DECIMAL(5,2),
    reaction_time_ms INT,
    test_date DATE,
    CONSTRAINT FK_Cognitive_Users FOREIGN KEY (user_id) 
        REFERENCES Users(user_id) ON DELETE CASCADE
);
GO

-- 4
CREATE TABLE Psychological_State (
    entry_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    anxiety_level INT CHECK (anxiety_level BETWEEN 1 AND 10),
    loneliness_score INT CHECK (loneliness_score BETWEEN 1 AND 10),
    boredom_tolerance INT CHECK (boredom_tolerance BETWEEN 1 AND 10),
    mood_rating VARCHAR(20) CHECK (mood_rating IN ('Very Low', 'Low', 'Neutral', 'High', 'Very High')),
    CONSTRAINT FK_Psychology_Users FOREIGN KEY (user_id) 
        REFERENCES Users(user_id) ON DELETE CASCADE
);
GO

-- 5
CREATE TABLE Physical_Health (
    physical_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    eye_strain_level INT CHECK (eye_strain_level BETWEEN 1 AND 10),
    neck_back_pain BIT, -- 1 = Yes, 0 = No
    daily_steps INT, 
    CONSTRAINT FK_Physical_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
Go

-- 6
CREATE TABLE Performance_Metrics (
    perf_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    gpa_or_rating DECIMAL(3,2),
    missed_deadlines_count INT,
    focus_during_work_score INT CHECK (focus_during_work_score BETWEEN 1 AND 10),
    CONSTRAINT FK_Perf_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
Go

-- 7
CREATE TABLE Social_Impact (
    social_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    face_to_face_interaction_hours DECIMAL(4,2),
    social_anxiety_level INT CHECK (social_anxiety_level BETWEEN 1 AND 10),
    family_conflicts_score INT CHECK (family_conflicts_score BETWEEN 1 AND 10),
    CONSTRAINT FK_Social_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
Go

-- 8
CREATE TABLE Sleep_Details (
    sleep_detail_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    latency_to_sleep_minutes INT, 
    night_awakenings INT,
    phone_before_sleep_minutes INT,
    CONSTRAINT FK_Sleep_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
Go

-- 9
CREATE TABLE Content_Interests (
    interest_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    primary_category VARCHAR(50), -- Memes, BrainRot-Core, Gaming, News
    is_educational_content BIT,
    daily_video_count INT,
    CONSTRAINT FK_Interest_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
Go

-- 10
CREATE TABLE Financial_Metrics (
    finance_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    in_app_purchases_usd DECIMAL(10,2),
    impulse_buying_frequency INT CHECK (impulse_buying_frequency BETWEEN 1 AND 10),
    CONSTRAINT FK_Finance_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
GO