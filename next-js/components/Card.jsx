import '@/app/globals.css';
import './Card.css';

import Link from 'next/link';

import "@fortawesome/fontawesome-svg-core/styles.css";
import { config } from "@fortawesome/fontawesome-svg-core";
config.autoAddCss = false;

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faShareNodes, faArrowUp } from "@fortawesome/free-solid-svg-icons";
import { faBookmark, faComment } from '@fortawesome/free-regular-svg-icons';

const baseUrl = "http://localhost:3000/documents/"


const Card = ({id, title, description, username, n_votes, n_comments, duration_ago, is_bookmarked}) => {
    const url = baseUrl + id

    return (
    <Link href={url}>
    <div className="card">
        <div className="cardTop">
            <h5 className="cardUsername darkGray">{username}</h5>
            <FontAwesomeIcon className="share gray" icon={faShareNodes} />
            <FontAwesomeIcon className="bkmrk gray" icon={faBookmark} />
        </div>
        <div className="cardMain">
            <h3 className="title darkGray">{title}</h3>
            <p className="description darkGray">{description}</p>
        </div>
        <div className="cardBottom">
            <div className="votes">
                <FontAwesomeIcon className="vote-arrow gray" icon={faArrowUp} />
                <p className="vote-num darkGray">{n_votes}</p>
            </div>
            <div className="comments">
                <FontAwesomeIcon className='comment-cloud gray' icon={faComment} />
                <p className="comment-num darkGray">{n_comments}</p>
            </div>
            <p className='time gray'>{timeDiff(duration_ago)}</p>
        </div>
    </div>
    </Link>
  )
}

const timeDiff = (timestamp) => {
    let tms = Date.now() - Date.parse(timestamp);
    let ts = tms / 1000;
    let tm = ts / 60;
    let th = tm / 60;
    let td = th / 24;
    let tw = td / 7;

    if(Math.floor(tw) > 0) return Math.floor(tw) + " weeks ago";
    if(Math.floor(td) > 0) return Math.floor(td) + " days ago";
    if(Math.floor(th) > 0) return Math.floor(th) + " hours ago";
    if(Math.floor(tm) > 0) return Math.floor(tm) + " minutes ago";
    return Math.floor(ts) + " seconds ago";
}

export default Card