package com.team.platform.pojo;

public class Columns {
    /**
     * 
     */
    private String tableSchema;

    /**
     * 
     */
    private String tableName;

    /**
     * 
     */
    private String columnName;

    /**
     * 
     */
    private Long colno;

    /**
     * 
     */
    private String isNullable;

    /**
     * 
     */
    private String dataType;

    /**
     * 
     */
    private Long length;

    /**
     * 
     */
    private Long scale;

    /**
     * 
     */
    private String columnComment;

    /**
     * 
     * @return TABLE_SCHEMA 
     */
    public String getTableSchema() {
        return tableSchema;
    }

    /**
     * 
     * @param tableSchema 
     */
    public void setTableSchema(String tableSchema) {
        this.tableSchema = tableSchema == null ? null : tableSchema.trim();
    }

    /**
     * 
     * @return TABLE_NAME 
     */
    public String getTableName() {
        return tableName;
    }

    /**
     * 
     * @param tableName 
     */
    public void setTableName(String tableName) {
        this.tableName = tableName == null ? null : tableName.trim();
    }

    /**
     * 
     * @return COLUMN_NAME 
     */
    public String getColumnName() {
        return columnName;
    }

    /**
     * 
     * @param columnName 
     */
    public void setColumnName(String columnName) {
        this.columnName = columnName == null ? null : columnName.trim();
    }

    /**
     * 
     * @return ORDINAL_POSITION 
     */
    public Long getColno() {
        return colno;
    }

    /**
     * 
     * @param colno 
     */
    public void setColno(Long colno) {
        this.colno = colno;
    }

    /**
     * 
     * @return IS_NULLABLE 
     */
    public String getIsNullable() {
        return isNullable;
    }

    /**
     * 
     * @param isNullable 
     */
    public void setIsNullable(String isNullable) {
        this.isNullable = isNullable == null ? null : isNullable.trim();
    }

    /**
     * 
     * @return DATA_TYPE 
     */
    public String getDataType() {
        return dataType;
    }

    /**
     * 
     * @param dataType 
     */
    public void setDataType(String dataType) {
        this.dataType = dataType == null ? null : dataType.trim();
    }

    /**
     * 
     * @return CHARACTER_MAXIMUM_LENGTH 
     */
    public Long getLength() {
        return length;
    }

    /**
     * 
     * @param length 
     */
    public void setLength(Long length) {
        this.length = length;
    }

    /**
     * 
     * @return NUMERIC_SCALE 
     */
    public Long getScale() {
        return scale;
    }

    /**
     * 
     * @param scale 
     */
    public void setScale(Long scale) {
        this.scale = scale;
    }

    /**
     * 
     * @return COLUMN_COMMENT 
     */
    public String getColumnComment() {
        return columnComment;
    }

    /**
     * 
     * @param columnComment 
     */
    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment == null ? null : columnComment.trim();
    }

}