<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="constants.AttributeConst" %>
<%@ page import="constants.ForwardConst" %>

<c:set var="actEmp" value="${ForwardConst.ACT_EMP.getValue()}" />
<c:set var="actRep" value="${ForwardConst.ACT_REP.getValue()}" />
<c:set var="commShow" value="${ForwardConst.CMD_SHOW.getValue()}" />
<c:set var="commNew" value="${ForwardConst.CMD_NEW.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commIdxL" value="${ForwardConst.CMD_INDEXLIKE.getValue()}" />

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>いいね　一覧</h2>
        <table id="like_list">
            <tbody>
                <tr>
                    <th class="like_name">氏名</th>
                    <th class="like_date">日時</th>
                </tr>
                <c:forEach var="like" items="${likes}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="like_name"><c:out value="${like.employee.name}" /></td>
                        <td class="like_date"><fmt:formatDate value='${like.createdAt}' pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${likes_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((likes_count - 1) / maxRow) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='?action=${actRep}&command=${commIdxL}&page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        </c:param>
</c:import>