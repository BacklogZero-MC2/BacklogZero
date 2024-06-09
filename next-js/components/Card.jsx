import '@/app/globals.css';
import './Card.css';

import "@fortawesome/fontawesome-svg-core/styles.css";
import { config } from "@fortawesome/fontawesome-svg-core";
config.autoAddCss = false;

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faShareNodes, faArrowUp } from "@fortawesome/free-solid-svg-icons";
import { faBookmark, faComment } from '@fortawesome/free-regular-svg-icons';


const Card = ({title, description, username, n_votes, n_comments, duration_ago, is_bookmarked}) => {
  return (
    <div className="card">
        <div className="cardTop">
            <h5 className="cardUsername">{username}</h5>
            <FontAwesomeIcon className="share gray" icon={faShareNodes} />
            <FontAwesomeIcon className="bkmrk gray" icon={faBookmark} />
        </div>
        <div className="cardMain">
            <h3 className="title">{title}</h3>
            <p className="description">{description}</p>
        </div>
        <div className="cardBottom">
            <div className="votes">
                <FontAwesomeIcon className="vote-arrow gray" icon={faArrowUp} />{n_votes}
            </div>
            <div className="comments">
                <FontAwesomeIcon className='comment-cloud gray' icon={faComment} />{n_comments}
            </div>
            <p className='time gray'>{duration_ago + " ago"}</p>
        </div>
    </div>
  )
}

export default Card