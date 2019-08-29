import express from "express";
import dataController from "../controllers/controller";
const router = express.Router();

router.get('/:org/members', dataController.getMembers);
router.get('/:org/comments', dataController.getComments);

export default router;
