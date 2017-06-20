package com.team.cms.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CmsVideoExample {
    /**
     * cms_video
     */
    protected String orderByClause;

    /**
     * cms_video
     */
    protected boolean distinct;

    /**
     * cms_video
     */
    protected List<Criteria> oredCriteria;

    /**
     *
     * @mbg.generated
     */
    public CmsVideoExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     *
     * @mbg.generated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     *
     * @mbg.generated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     *
     * @mbg.generated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     *
     * @mbg.generated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     *
     * @mbg.generated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     *
     * @mbg.generated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     *
     * @mbg.generated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     *
     * @mbg.generated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     *
     * @mbg.generated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     *
     * @mbg.generated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * cms_video null
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andVideoIdIsNull() {
            addCriterion("video_id is null");
            return (Criteria) this;
        }

        public Criteria andVideoIdIsNotNull() {
            addCriterion("video_id is not null");
            return (Criteria) this;
        }

        public Criteria andVideoIdEqualTo(String value) {
            addCriterion("video_id =", value, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdNotEqualTo(String value) {
            addCriterion("video_id <>", value, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdGreaterThan(String value) {
            addCriterion("video_id >", value, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdGreaterThanOrEqualTo(String value) {
            addCriterion("video_id >=", value, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdLessThan(String value) {
            addCriterion("video_id <", value, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdLessThanOrEqualTo(String value) {
            addCriterion("video_id <=", value, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdLike(String value) {
            addCriterion("video_id like", value, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdNotLike(String value) {
            addCriterion("video_id not like", value, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdIn(List<String> values) {
            addCriterion("video_id in", values, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdNotIn(List<String> values) {
            addCriterion("video_id not in", values, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdBetween(String value1, String value2) {
            addCriterion("video_id between", value1, value2, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoIdNotBetween(String value1, String value2) {
            addCriterion("video_id not between", value1, value2, "videoId");
            return (Criteria) this;
        }

        public Criteria andVideoTitleIsNull() {
            addCriterion("video_title is null");
            return (Criteria) this;
        }

        public Criteria andVideoTitleIsNotNull() {
            addCriterion("video_title is not null");
            return (Criteria) this;
        }

        public Criteria andVideoTitleEqualTo(String value) {
            addCriterion("video_title =", value, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleNotEqualTo(String value) {
            addCriterion("video_title <>", value, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleGreaterThan(String value) {
            addCriterion("video_title >", value, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleGreaterThanOrEqualTo(String value) {
            addCriterion("video_title >=", value, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleLessThan(String value) {
            addCriterion("video_title <", value, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleLessThanOrEqualTo(String value) {
            addCriterion("video_title <=", value, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleLike(String value) {
            addCriterion("video_title like", value, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleNotLike(String value) {
            addCriterion("video_title not like", value, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleIn(List<String> values) {
            addCriterion("video_title in", values, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleNotIn(List<String> values) {
            addCriterion("video_title not in", values, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleBetween(String value1, String value2) {
            addCriterion("video_title between", value1, value2, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoTitleNotBetween(String value1, String value2) {
            addCriterion("video_title not between", value1, value2, "videoTitle");
            return (Criteria) this;
        }

        public Criteria andVideoImageIsNull() {
            addCriterion("video_image is null");
            return (Criteria) this;
        }

        public Criteria andVideoImageIsNotNull() {
            addCriterion("video_image is not null");
            return (Criteria) this;
        }

        public Criteria andVideoImageEqualTo(String value) {
            addCriterion("video_image =", value, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageNotEqualTo(String value) {
            addCriterion("video_image <>", value, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageGreaterThan(String value) {
            addCriterion("video_image >", value, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageGreaterThanOrEqualTo(String value) {
            addCriterion("video_image >=", value, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageLessThan(String value) {
            addCriterion("video_image <", value, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageLessThanOrEqualTo(String value) {
            addCriterion("video_image <=", value, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageLike(String value) {
            addCriterion("video_image like", value, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageNotLike(String value) {
            addCriterion("video_image not like", value, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageIn(List<String> values) {
            addCriterion("video_image in", values, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageNotIn(List<String> values) {
            addCriterion("video_image not in", values, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageBetween(String value1, String value2) {
            addCriterion("video_image between", value1, value2, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoImageNotBetween(String value1, String value2) {
            addCriterion("video_image not between", value1, value2, "videoImage");
            return (Criteria) this;
        }

        public Criteria andVideoDescIsNull() {
            addCriterion("video_desc is null");
            return (Criteria) this;
        }

        public Criteria andVideoDescIsNotNull() {
            addCriterion("video_desc is not null");
            return (Criteria) this;
        }

        public Criteria andVideoDescEqualTo(String value) {
            addCriterion("video_desc =", value, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescNotEqualTo(String value) {
            addCriterion("video_desc <>", value, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescGreaterThan(String value) {
            addCriterion("video_desc >", value, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescGreaterThanOrEqualTo(String value) {
            addCriterion("video_desc >=", value, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescLessThan(String value) {
            addCriterion("video_desc <", value, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescLessThanOrEqualTo(String value) {
            addCriterion("video_desc <=", value, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescLike(String value) {
            addCriterion("video_desc like", value, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescNotLike(String value) {
            addCriterion("video_desc not like", value, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescIn(List<String> values) {
            addCriterion("video_desc in", values, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescNotIn(List<String> values) {
            addCriterion("video_desc not in", values, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescBetween(String value1, String value2) {
            addCriterion("video_desc between", value1, value2, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andVideoDescNotBetween(String value1, String value2) {
            addCriterion("video_desc not between", value1, value2, "videoDesc");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("createtime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("createtime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(Date value) {
            addCriterion("createtime =", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(Date value) {
            addCriterion("createtime <>", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(Date value) {
            addCriterion("createtime >", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("createtime >=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(Date value) {
            addCriterion("createtime <", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("createtime <=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<Date> values) {
            addCriterion("createtime in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<Date> values) {
            addCriterion("createtime not in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(Date value1, Date value2) {
            addCriterion("createtime between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("createtime not between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andIstopIsNull() {
            addCriterion("istop is null");
            return (Criteria) this;
        }

        public Criteria andIstopIsNotNull() {
            addCriterion("istop is not null");
            return (Criteria) this;
        }

        public Criteria andIstopEqualTo(String value) {
            addCriterion("istop =", value, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopNotEqualTo(String value) {
            addCriterion("istop <>", value, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopGreaterThan(String value) {
            addCriterion("istop >", value, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopGreaterThanOrEqualTo(String value) {
            addCriterion("istop >=", value, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopLessThan(String value) {
            addCriterion("istop <", value, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopLessThanOrEqualTo(String value) {
            addCriterion("istop <=", value, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopLike(String value) {
            addCriterion("istop like", value, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopNotLike(String value) {
            addCriterion("istop not like", value, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopIn(List<String> values) {
            addCriterion("istop in", values, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopNotIn(List<String> values) {
            addCriterion("istop not in", values, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopBetween(String value1, String value2) {
            addCriterion("istop between", value1, value2, "istop");
            return (Criteria) this;
        }

        public Criteria andIstopNotBetween(String value1, String value2) {
            addCriterion("istop not between", value1, value2, "istop");
            return (Criteria) this;
        }

        public Criteria andOrdernumIsNull() {
            addCriterion("ordernum is null");
            return (Criteria) this;
        }

        public Criteria andOrdernumIsNotNull() {
            addCriterion("ordernum is not null");
            return (Criteria) this;
        }

        public Criteria andOrdernumEqualTo(Integer value) {
            addCriterion("ordernum =", value, "ordernum");
            return (Criteria) this;
        }

        public Criteria andOrdernumNotEqualTo(Integer value) {
            addCriterion("ordernum <>", value, "ordernum");
            return (Criteria) this;
        }

        public Criteria andOrdernumGreaterThan(Integer value) {
            addCriterion("ordernum >", value, "ordernum");
            return (Criteria) this;
        }

        public Criteria andOrdernumGreaterThanOrEqualTo(Integer value) {
            addCriterion("ordernum >=", value, "ordernum");
            return (Criteria) this;
        }

        public Criteria andOrdernumLessThan(Integer value) {
            addCriterion("ordernum <", value, "ordernum");
            return (Criteria) this;
        }

        public Criteria andOrdernumLessThanOrEqualTo(Integer value) {
            addCriterion("ordernum <=", value, "ordernum");
            return (Criteria) this;
        }

        public Criteria andOrdernumIn(List<Integer> values) {
            addCriterion("ordernum in", values, "ordernum");
            return (Criteria) this;
        }

        public Criteria andOrdernumNotIn(List<Integer> values) {
            addCriterion("ordernum not in", values, "ordernum");
            return (Criteria) this;
        }

        public Criteria andOrdernumBetween(Integer value1, Integer value2) {
            addCriterion("ordernum between", value1, value2, "ordernum");
            return (Criteria) this;
        }

        public Criteria andOrdernumNotBetween(Integer value1, Integer value2) {
            addCriterion("ordernum not between", value1, value2, "ordernum");
            return (Criteria) this;
        }

        public Criteria andClicksIsNull() {
            addCriterion("clicks is null");
            return (Criteria) this;
        }

        public Criteria andClicksIsNotNull() {
            addCriterion("clicks is not null");
            return (Criteria) this;
        }

        public Criteria andClicksEqualTo(Integer value) {
            addCriterion("clicks =", value, "clicks");
            return (Criteria) this;
        }

        public Criteria andClicksNotEqualTo(Integer value) {
            addCriterion("clicks <>", value, "clicks");
            return (Criteria) this;
        }

        public Criteria andClicksGreaterThan(Integer value) {
            addCriterion("clicks >", value, "clicks");
            return (Criteria) this;
        }

        public Criteria andClicksGreaterThanOrEqualTo(Integer value) {
            addCriterion("clicks >=", value, "clicks");
            return (Criteria) this;
        }

        public Criteria andClicksLessThan(Integer value) {
            addCriterion("clicks <", value, "clicks");
            return (Criteria) this;
        }

        public Criteria andClicksLessThanOrEqualTo(Integer value) {
            addCriterion("clicks <=", value, "clicks");
            return (Criteria) this;
        }

        public Criteria andClicksIn(List<Integer> values) {
            addCriterion("clicks in", values, "clicks");
            return (Criteria) this;
        }

        public Criteria andClicksNotIn(List<Integer> values) {
            addCriterion("clicks not in", values, "clicks");
            return (Criteria) this;
        }

        public Criteria andClicksBetween(Integer value1, Integer value2) {
            addCriterion("clicks between", value1, value2, "clicks");
            return (Criteria) this;
        }

        public Criteria andClicksNotBetween(Integer value1, Integer value2) {
            addCriterion("clicks not between", value1, value2, "clicks");
            return (Criteria) this;
        }

        public Criteria andYoukuidIsNull() {
            addCriterion("youkuid is null");
            return (Criteria) this;
        }

        public Criteria andYoukuidIsNotNull() {
            addCriterion("youkuid is not null");
            return (Criteria) this;
        }

        public Criteria andYoukuidEqualTo(String value) {
            addCriterion("youkuid =", value, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidNotEqualTo(String value) {
            addCriterion("youkuid <>", value, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidGreaterThan(String value) {
            addCriterion("youkuid >", value, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidGreaterThanOrEqualTo(String value) {
            addCriterion("youkuid >=", value, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidLessThan(String value) {
            addCriterion("youkuid <", value, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidLessThanOrEqualTo(String value) {
            addCriterion("youkuid <=", value, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidLike(String value) {
            addCriterion("youkuid like", value, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidNotLike(String value) {
            addCriterion("youkuid not like", value, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidIn(List<String> values) {
            addCriterion("youkuid in", values, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidNotIn(List<String> values) {
            addCriterion("youkuid not in", values, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidBetween(String value1, String value2) {
            addCriterion("youkuid between", value1, value2, "youkuid");
            return (Criteria) this;
        }

        public Criteria andYoukuidNotBetween(String value1, String value2) {
            addCriterion("youkuid not between", value1, value2, "youkuid");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
            return (Criteria) this;
        }
    }

    /**
     * cms_video
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * cms_video null
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}