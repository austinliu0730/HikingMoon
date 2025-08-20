
CREATE TABLE MountainTrails (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    badge NVARCHAR(50) NOT NULL,                    -- �ʩ����� (�ʩ�, �X�w�s�p, �����s, �p�ʩ�)
    walk_days INT NOT NULL,                         -- ��ĳ�Ѽ� (1-3��)
    location NVARCHAR(100) NOT NULL,                -- �Ҧb�����m��
    mt_name NVARCHAR(100) NOT NULL,                 -- �n�s�B�D�W��
    diff INT NOT NULL,                              -- ���׵��� (1-3)
    dist_km DECIMAL(5,2) NOT NULL,                  -- �Z��������
    time_min INT NOT NULL,                          -- �w�p�ɶ�(����)
    ascend_m INT NOT NULL,                          -- �W�ɰ���(����)
    descend_m INT NOT NULL,                         -- �U������(����)
    trail_cond NVARCHAR(200),                       -- �B�D���p
    route_type NVARCHAR(50),                        -- ���u����
    min_alt_m INT NOT NULL,                         -- �̧C����(����)
    max_alt_m INT NOT NULL,                         -- �̰�����(����)
    mt_range NVARCHAR(50),                          -- �s�ߨt��
    park_permit TINYINT NOT NULL,                   -- ��a����J��ӽ� (0:�_, 1:�O)
    mt_permit TINYINT NOT NULL,                     -- �n�s�p�e�ѥӽ� (0:�_, 1:�O)
    TripDetails NTEXT,                              -- ���u�ԲӴy�z
    region NVARCHAR(10) NOT NULL,                   -- �a�� (�F, ��, �n, �_)
    
    -- �إ߯��޴��ɬd�߮į�
    INDEX IX_MountainTrails_Badge (badge),
    INDEX IX_MountainTrails_Difficulty (diff),
    INDEX IX_MountainTrails_Region (region),
    INDEX IX_MountainTrails_WalkDays (walk_days),
    INDEX IX_MountainTrails_MaxAlt (max_alt_m)
);

-- �s�W���ѻ���
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'�x�W�n�s���u��ƪ�',
    @level0type = N'Schema', @level0name = 'dbo',
    @level1type = N'Table', @level1name = 'MountainTrails';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'���u�����G�ʩ��B�X�w�s�p�B�����s�B�p�ʩ�',
    @level0type = N'Schema', @level0name = 'dbo',
    @level1type = N'Table', @level1name = 'MountainTrails',
    @level2type = N'Column', @level2name = 'badge';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'���׵��šG1=²��, 2=����, 3=�x��',
    @level0type = N'Schema', @level0name = 'dbo',
    @level1type = N'Table', @level1name = 'MountainTrails',
    @level2type = N'Column', @level2name = 'diff';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'�a�ϡG�F���B�����B�n���B�_��',
    @level0type = N'Schema', @level0name = 'dbo',
    @level1type = N'Table', @level1name = 'MountainTrails',
    @level2type = N'Column', @level2name = 'region';