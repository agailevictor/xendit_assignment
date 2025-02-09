import express from "express";
import dataController from "../controllers/controller";
const router = express.Router();

router.get('/:org/members', dataController.getMembers);
router.get('/:org/comments', dataController.getComments);
router.post('/:org/comments', dataController.postComments);
router.delete('/:org/comments', dataController.deleteComments);

export default router;
