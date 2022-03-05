package services;

import java.time.LocalDateTime;
import java.util.List;

import actions.views.LikeConverter;
import actions.views.LikeView;
import actions.views.ReportConverter;
import actions.views.ReportView;
import constants.JpaConst;
import models.Like;

public class LikeService extends ServiceBase {


    public void create(LikeView lv) {
        LocalDateTime ldt = LocalDateTime.now();
        lv.setCreatedAt(ldt);
        lv.setUpdatedAt(ldt);
        createInternal(lv);
    }


/**
 * 日報データを1件登録する
 * @param rv 日報データ
 */
private void createInternal(LikeView lv) {

    em.getTransaction().begin();
    em.persist(LikeConverter.toModel(lv));
    em.getTransaction().commit();

}

public List<LikeView> getMinePerPage(ReportView report, int page) {

    List<Like> likes = em.createNamedQuery(JpaConst.Q_LIK_GET_ALL_MINE, Like.class)
            .setParameter(JpaConst.JPQL_PARM_REPORT, ReportConverter.toModel(report))
            .setFirstResult(JpaConst.ROW_PER_PAGE * (page - 1))
            .setMaxResults(JpaConst.ROW_PER_PAGE)
            .getResultList();
    return LikeConverter.toViewList(likes);
}

public long countAllMine(ReportView report) {
    long count = (long) em.createNamedQuery(JpaConst.Q_LIK_COUNT_ALL_MINE, Long.class)
            .setParameter(JpaConst.JPQL_PARM_REPORT, ReportConverter.toModel(report))
            .getSingleResult();

    return count;

}

public List<LikeView> getAllPerPage(ReportView report, int page) {

    return null;
}


public long countAll(ReportView report) {

    return 0;
}

public LikeView findOne(int id) {
    return LikeConverter.toView(findOneInternal(id));
}

private Like findOneInternal(int id) {
    return em.find(Like.class, id);
}

}