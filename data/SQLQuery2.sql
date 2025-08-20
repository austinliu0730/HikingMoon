
CREATE TABLE MountainTrails (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    badge NVARCHAR(50) NOT NULL,                    -- 百岳分類 (百岳, 合歡群峰, 平岩山, 小百岳)
    walk_days INT NOT NULL,                         -- 建議天數 (1-3天)
    location NVARCHAR(100) NOT NULL,                -- 所在縣市鄉鎮
    mt_name NVARCHAR(100) NOT NULL,                 -- 登山步道名稱
    diff INT NOT NULL,                              -- 難度等級 (1-3)
    dist_km DECIMAL(5,2) NOT NULL,                  -- 距離公里數
    time_min INT NOT NULL,                          -- 預計時間(分鐘)
    ascend_m INT NOT NULL,                          -- 上升高度(公尺)
    descend_m INT NOT NULL,                         -- 下降高度(公尺)
    trail_cond NVARCHAR(200),                       -- 步道狀況
    route_type NVARCHAR(50),                        -- 路線類型
    min_alt_m INT NOT NULL,                         -- 最低海拔(公尺)
    max_alt_m INT NOT NULL,                         -- 最高海拔(公尺)
    mt_range NVARCHAR(50),                          -- 山脈系統
    park_permit TINYINT NOT NULL,                   -- 國家公園入園申請 (0:否, 1:是)
    mt_permit TINYINT NOT NULL,                     -- 登山計畫書申請 (0:否, 1:是)
    TripDetails NTEXT,                              -- 路線詳細描述
    region NVARCHAR(10) NOT NULL,                   -- 地區 (東, 中, 南, 北)
    
    -- 建立索引提升查詢效能
    INDEX IX_MountainTrails_Badge (badge),
    INDEX IX_MountainTrails_Difficulty (diff),
    INDEX IX_MountainTrails_Region (region),
    INDEX IX_MountainTrails_WalkDays (walk_days),
    INDEX IX_MountainTrails_MaxAlt (max_alt_m)
);

-- 新增註解說明
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'台灣登山路線資料表',
    @level0type = N'Schema', @level0name = 'dbo',
    @level1type = N'Table', @level1name = 'MountainTrails';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'路線分類：百岳、合歡群峰、平岩山、小百岳',
    @level0type = N'Schema', @level0name = 'dbo',
    @level1type = N'Table', @level1name = 'MountainTrails',
    @level2type = N'Column', @level2name = 'badge';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'難度等級：1=簡單, 2=中等, 3=困難',
    @level0type = N'Schema', @level0name = 'dbo',
    @level1type = N'Table', @level1name = 'MountainTrails',
    @level2type = N'Column', @level2name = 'diff';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'地區：東部、中部、南部、北部',
    @level0type = N'Schema', @level0name = 'dbo',
    @level1type = N'Table', @level1name = 'MountainTrails',
    @level2type = N'Column', @level2name = 'region';